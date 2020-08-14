# hello_world

## TextWidget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextWidget',
      home: Scaffold(
        body: Center(
          child: Text(
            'Hahahahahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.pink,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
```


## ContainerWidget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContainerWidget',
      home: Scaffold(
        body: Center(
            child: Container(
          child: Text(
            'Hello ContainerWidget!',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.blueGrey,
            ),
          ),
          alignment: Alignment.topLeft,
          width: 500.0,
          height: 500.0,
//          color: Colors.purple,
          padding: EdgeInsets.fromLTRB(10.0, 100.0, 0.0, 0.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.indigo,
            Colors.amber,
            Colors.deepPurple,
            Colors.orange
          ]),
          border: Border.all(width: 5.0,color: Colors.cyanAccent)
          ),
        )),
      ),
    );
  }
}
```

## ImageWidget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContainerWidget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Image.network(
                'https://flutter.cn/asset/flutter-hero-laptop2.png',
              fit: BoxFit.fitWidth,
              color: Colors.greenAccent,
              colorBlendMode: BlendMode.colorBurn,
//              repeat: ImageRepeat.repeatY,
            ),
            width: 500.0,
            height: 500.0,
            color: Colors.cyanAccent,
         ),
        ),
      ),
    );
  }
}
```