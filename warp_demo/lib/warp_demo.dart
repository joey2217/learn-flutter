import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> _list = [];
  @override
  void initState() {
    _list..add(buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Warp Demo'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              children: _list,
              spacing: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (_list.length < 9) {
          setState(() {
            _list.insert(_list.length - 1, buildSquare());
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildSquare() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text(_list.length.toString()),
        ),
      ),
    );
  }
}
