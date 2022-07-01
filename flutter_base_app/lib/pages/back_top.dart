import 'package:flutter/material.dart';

class BackTop extends StatefulWidget {
  const BackTop({Key? key}) : super(key: key);

  @override
  State<BackTop> createState() => _BackTopState();
}

class _BackTopState extends State<BackTop> {
  bool _showBackTop = false;
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && _showBackTop) {
        setState(() {
          _showBackTop = false;
        });
      } else if (_controller.offset >= 1000 && !_showBackTop) {
        setState(() {
          _showBackTop = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BackTop"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemExtent: 50,
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Item$index"),
            );
          }),
      floatingActionButton: _showBackTop
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              })
          : null,
    );
  }
}
