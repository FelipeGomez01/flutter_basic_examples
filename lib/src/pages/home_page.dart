import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextStyle myTextStyle = TextStyle(fontSize: 25.0);
  int conteo = 0;

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
              'Numero de clicks:',
              style: myTextStyle,
            ),
            Text(
              '0',
              style: myTextStyle,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('Hola Mundo.'),
      ),
    );
  }
}
