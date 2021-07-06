import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextStyle _myTextStyle = TextStyle(fontSize: 25.0);
  int _counting = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de tabs:',
              style: _myTextStyle,
            ),
            Text(
              '$_counting',
              style: _myTextStyle,
            ),
          ],
        ),
      ),
      floatingActionButton: _createButtons(),
    );
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero), onPressed: _reset),
        Expanded(
          child: SizedBox(),
        ),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _subtract),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _add),
      ],
    );
  }

  void _add() {
    setState(() => _counting++);
  }

  void _subtract() {
    setState(() => _counting--);
  }

  void _reset() {
    setState(() => _counting = 0);
  }
}
