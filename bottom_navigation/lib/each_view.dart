import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  final String title;
  EachView(this.title);

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text(widget.title)),
    );
  }
}
