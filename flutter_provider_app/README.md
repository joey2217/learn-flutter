# flutter_provider_app

https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md

## install

```sh
flutter pub add provider
```

## Model

```dart
// count_model.dart
import 'package:flutter/widgets.dart';

class CountModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count += 1;
    notifyListeners();
  }

  void minus() {
    _count -= 1;
    notifyListeners();
  }
}
```

## Provider

```dart
//main.dart
// ...
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(create: (context) => CountModel()),
      ],
      child: const MyApp()
    ));
}
// ...
```

## Use

最简单的读取值的方式就是使用 BuildContext 上的扩展属性（由 provider 注入）。

- context.watch<T>()，widget 能够监听到 T 类型的 provider 发生的改变。
- context.read<T>()，直接返回 T，不会监听改变。
- context.select<T，R>(R cb(T value))，允许 widget 只监听 T 上的一部分内容的改变。

你也可以使用 Provider.of<T>(context) 这一静态方法，它的表现类似 watch， 而在你为传入 listen: false 参数时（例如 Provider.of<T>(context，listen: false)）， 它的表现与 read 类似。

值得注意的是，context.read<T>() 方法不会在值变化时让 widget 重新构建， 并且不能在 StatelessWidget.build 和 State.build 内调用. 换句话说，它可以在除了这两个方法以外的任意位置调用。


```dart
Text('${Provider.of<CountModel>(context).count}')
```
