import 'package:flutter/material.dart';
import 'package:flutter_basic_examples/src/pages/counter_page.dart';
import 'package:flutter_basic_examples/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}
