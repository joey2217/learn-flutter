import 'package:flutter/material.dart';

class ValueListenablePage extends StatefulWidget {
  const ValueListenablePage({Key? key}) : super(key: key);

  @override
  State<ValueListenablePage> createState() => _ValueListenablePageState();
}

class _ValueListenablePageState extends State<ValueListenablePage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("ValueListenablePage"),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                Text(
                  '$value 次',
                  textScaleFactor: textScaleFactor,
                )
              ],
            );
          },
          child: const Text(
            '点击了',
            textScaleFactor: textScaleFactor,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _counter.value += 1;
        },
      ),
    );
  }
}
