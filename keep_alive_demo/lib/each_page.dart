import 'package:flutter/material.dart';

class EachPage extends StatefulWidget {
  @override
  _EachPageState createState() => _EachPageState();
}

class _EachPageState extends State<EachPage>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count++;
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCount,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Click once,increase one.'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
