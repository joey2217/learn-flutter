import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (var i = 0; i < 6; i++) {
      children.add(Page(text: i.toString()));
    }
    final PageController controller = PageController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("PageView"),
        ),
        body: PageView(
          controller: controller,
          allowImplicitScrolling: true,
          children: children,
        ));
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(
      child: Text(
        widget.text,
        textScaleFactor: 5,
      ),
    );
  }
}
