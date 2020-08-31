import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Navigator', routes: {
    "/": (context) => FirstScreen(),
    "second": (context) => SecondScreen(),
  }));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Center(
            child: RaisedButton(
          child: Text('Detail'),
          onPressed: () {
            Navigator.of(context).pushNamed('second', arguments: 'param');
          },
        )));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('Detail')),
        body: Center(
            child: RaisedButton(
          child: Text(args),
          onPressed: () {
            Navigator.pop(context);
          },
        )));
  }
}
