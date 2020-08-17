import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Navigator', home: new FirstScreen()));
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          },
        )));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Detail')),
        body: Center(
            child: RaisedButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        )));
  }
}
