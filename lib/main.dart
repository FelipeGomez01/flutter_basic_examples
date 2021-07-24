import 'package:flutter/material.dart';
import 'package:flutter_basic_examples/src/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
