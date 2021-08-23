import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget
{
  @override
  _SliderPage createState() => _SliderPage();
}

class _SliderPage extends State<SliderPage>
{
  double _sliderValue = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSlider()
  {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de Imagen',
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (!_blockCheck)? null : (value){
        setState(() {
          _sliderValue = value;
        });
      }
    );
  }

  Widget _createImage()
  {
    return Image(
      image: NetworkImage(
        'https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Imagen3-245003649.jpg?w=800'
      ),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }

  Widget _createCheckBox()
  {
    /*return Checkbox(
      value: _blockCheck,
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      }
    );*/

    return CheckboxListTile(
      title: Text('Habilitar Slider'),
      value: _blockCheck,
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      }
    );
  }

  Widget _createSwitch()
  {
    return SwitchListTile(
        title: Text('Habilitar Slider'),
        value: _blockCheck,
        onChanged: (value){
          setState(() {
            _blockCheck = value;
          });
        }
    );
  }
}