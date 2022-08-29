import 'package:flutter/material.dart';

class DargPage extends StatefulWidget {
  const DargPage({Key? key}) : super(key: key);

  @override
  State<DargPage> createState() => _DargPageState();
}

class _DargPageState extends State<DargPage> {
  var _top = 0.0;
  var _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Darg"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: const CircleAvatar(
                child: Text("A"),
              ),
              onPanDown: (DragDownDetails e) {
                print("按下${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}
