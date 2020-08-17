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

## ListViewWidget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final items = List.generate(100, (i) => "Item $i");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Widget',
      home: Scaffold(
          appBar: AppBar(
            title: Text('ListView Widget!'),
          ),
          body: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(title: Text("${items[index]}"));
              })),
    );
  }
}
```

## GridView Widget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final items = List.generate(100, (i) => "Item $i");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView Widget!'),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.7,
          ),
          children: <Widget>[
            Image.network(
                'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',
                fit: BoxFit.cover),
            Image.network(
                'http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',
                fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
```

## Row Widget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Widget',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Row Widget!'),
          ),
          body: Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('Left'),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Center'),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Right'),
              ),
            ],
          )),
    );
  }
}
```

## Column Widget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Widget',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Column Widget!'),
          ),
          body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Header'),
                Expanded(child: Text('Main')),
                Text('Footer'),
              ],
            ),
          )
      ),
    );
  }
}
```

## Stack Widget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Widget',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Stack Widget!'),
          ),
          body: Center(
            child: Stack(
              alignment: FractionalOffset(0.5, 0.5),
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://tse1-mm.cn.bing.net/th/id/OIP.MJkshK46oHi0WyouCNvzwwAAAA?pid=Api&rs=1'),
                  ),
                ),
                Text('Flutter'),
              ],
            ),
          )),
    );
  }
}
```

## Positioned Widget

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Positioned Widget',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Positioned Widget!'),
          ),
          body: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://tse1-mm.cn.bing.net/th/id/OIP.MJkshK46oHi0WyouCNvzwwAAAA?pid=Api&rs=1'),
                  ),
                ),
                Positioned(left: 40.0, top: 50.0, child: Text('Flutter'))
              ],
            ),
          )),
    );
  }
}
```

## Navigator

```dart
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
```
