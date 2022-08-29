import 'package:flutter/material.dart';

class AnimatedSwitcherCounter extends StatefulWidget {
  const AnimatedSwitcherCounter({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherCounter> createState() =>
      _AnimatedSwitcherCounterState();
}

class _AnimatedSwitcherCounterState extends State<AnimatedSwitcherCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedSwitcherCounter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                "$_count",
                key: ValueKey(_count),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                },
                child: const Text('+1'))
          ],
        ),
      ),
    );
  }
}
