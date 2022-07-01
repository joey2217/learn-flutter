import 'package:flutter/material.dart';

class Constraints extends StatelessWidget {
  const Constraints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget redBox = const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Constraints"),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0 //最小高度为50像素
                ),
            child: Container(
              height: 5.0,
              child: redBox,
            ),
          )
        ],
      ),
    );
  }
}
