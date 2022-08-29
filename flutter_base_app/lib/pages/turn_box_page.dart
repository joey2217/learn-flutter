import 'package:flutter/material.dart';
import 'package:flutter_base_app/widgets/turn_box.dart';

class TurnBoxPage extends StatefulWidget {
  const TurnBoxPage({Key? key}) : super(key: key);

  @override
  State<TurnBoxPage> createState() => _TurnBoxPageState();
}

class _TurnBoxPageState extends State<TurnBoxPage> {
  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TurnBox"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TurnBox(
                turns: _turns,
                speed: 500,
                child: const Icon(
                  Icons.refresh,
                  size: 50,
                )),
            TurnBox(
                turns: _turns,
                speed: 1000,
                child: const Icon(
                  Icons.refresh,
                  size: 150,
                )),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _turns += 0.2;
                });
              },
              child: const Text("顺时针旋转1/5圈"),
            ),
            ElevatedButton(
              child: const Text("逆时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns -= .2;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
