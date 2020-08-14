import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Widget',
      home: Scaffold(
         appBar: AppBar(
           title: Text('ListView Widget!'),
         ),
        body: ListView(
          children: [],
        ),
      ),
    );
  }
}
