import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  EachView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
