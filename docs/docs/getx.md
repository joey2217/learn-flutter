---
sidebar_position: 1
---

# [GetX](https://pub.dev/packages/get)

## 安装

### pub add

```sh
flutter pub add get
```

### pubspec.yml

```yml
dependencies:
  get: version
```

### import

```dart
import 'package:get/get.dart';
```

## 实用工具

- [VSCode GetX Snippets](https://marketplace.visualstudio.com/items?itemName=get-snippets.get-snippets)

- [jetbrains GetX Snippets](https://plugins.jetbrains.com/plugin/14975-getx-snippets)

- [jetbrains GetX Template](https://plugins.jetbrains.com/plugin/15919-getx)

- [getx_pattern](https://github.com/kauemurakami/getx_pattern/)

- [GetX使用](https://juejin.cn/post/6924104248275763208)

- [GetX原理](https://juejin.cn/post/6984593635681517582)

## [使用](https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md)

> <https://github.com/jonataslaw/getx/tree/master/documentation/zh_CN>

1. 使用GetMaterialApp

```dart
void main() => runApp(GetMaterialApp(home: Home()));
```

2. 创建Controller

```dart
class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}
```

3. 创建页面

```dart
class Home extends StatelessWidget {

  @override
  Widget build(context) {

    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

      // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
      body: Center(child: ElevatedButton(
              child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller c = Get.find();

  @override
  Widget build(context){
     // 访问更新后的计数变量
     return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
```
