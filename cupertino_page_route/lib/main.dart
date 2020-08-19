import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: CupertinoPageRouteDemo(),
    );
  }
}

class CupertinoPageRouteDemo extends StatelessWidget {
  const CupertinoPageRouteDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        color: CupertinoColors.activeBlue,
        child: CupertinoButton(
          onPressed: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return CupertinoPageRouteDemo();
            }));
          },
          child: Icon(
            CupertinoIcons.add,
            color: CupertinoColors.white,
          ),
        ),
      ),
    ));
  }
}
