import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Buttons",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('ElevatedButton'),
        ),
        TextButton(
          child: const Text("TextButton"),
          onPressed: () {},
        ),
        OutlinedButton(onPressed: () {}, child: const Text("OutlinedButton")),
      ],
    );
  }
}