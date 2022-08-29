import 'dart:collection';

import 'package:flutter/material.dart';

import 'my_provider.dart';

class Item {
  Item(this.price, this.count);
  double price; //商品单价
  int count; // 商品份数
  //... 省略其它属性
}

class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.price * element.count);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Consumer<CartModel>(
                      builder: (context, cart) =>
                          Text("总价: ${cart?.totalPrice}")),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        onPressed: () {
                          ChangeNotifierProvider.of<CartModel>(context,
                                  listen: false)
                              ?.add(Item(10, 1));
                        },
                        child: const Text("添加商品"));
                  })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
