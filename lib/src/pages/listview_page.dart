import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget
{
  @override
  _ListViewPage createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage>
{
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = [];
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _addTen();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels ==
         _scrollController.position.maxScrollExtent)
      {
        //_addTen();
        fetchData();
      }
    });
  }

  @override
  void dispose()
  {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      )
    );
  }

  Widget _createList()
  {
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index)
        {
          final image = _listNumbers[index];

          return FadeInImage(
            placeholder: AssetImage(
              'assets/jar-loading.gif'
            ),
            image: NetworkImage(
              'https://picsum.photos/500/300/?image=$image'
            )
          );
        }
      )
    );
  }

  Future<void> getPageOne() async
  {
    final duration = new Duration(seconds: 2);

    setState(() {
      new Timer (duration, (){
        _listNumbers.clear();
        _lastNumber++;
      });
    });

    _addTen();
  }

  void _addTen()
  {
    for(int i = 0; i < 10; i++)
    {
      _lastNumber++;
      _listNumbers.add(_lastNumber);
    }

    setState(() {});
  }

  Future<Null> fetchData() async
  {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer (duration, responseHTTP);
  }

  void responseHTTP()
  {
    _isLoading = false;

    _addTen();

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
  }

  Widget _createLoading()
  {
    Widget loading = Container();

    if(_isLoading)
    {
      loading = Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }

    return loading;
  }
}