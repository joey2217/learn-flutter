import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigation',
      theme: ThemeData.light(),
      home: BottomNavigation(),
    );
  }
}
