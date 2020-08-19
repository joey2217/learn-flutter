import 'package:flutter/material.dart';
import 'expansion_tile_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionDemo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ExpansionTileDemo(),
    );
  }
}
