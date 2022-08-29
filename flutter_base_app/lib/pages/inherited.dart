import 'package:flutter/material.dart';

class InheritedTestPage extends StatefulWidget {
  const InheritedTestPage({Key? key}) : super(key: key);

  @override
  State<InheritedTestPage> createState() => _InheritedTestPageState();
}

class _InheritedTestPageState extends State<InheritedTestPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedTestPage"),
      ),
      body: Center(
        child: ShareDataWidget(
            data: _count,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: _TestWidget(),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count++;
                      });
                    },
                    child: const Text("Increment"))
              ],
            )),
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({Key? key}) : super(key: key);

  @override
  State<_TestWidget> createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({Key? key, required this.data, required super.child})
      : super(key: key);

  final int data;

  static ShareDataWidget? of(BuildContext context) {
    // return context
    //     .getElementForInheritedWidgetOfExactType<ShareDataWidget>()
    //     ?.widget; //不会触发 didChangeDependencies
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}
