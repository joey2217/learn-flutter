import 'package:flutter/material.dart';

class KeepAlivePageView extends StatelessWidget {
  const KeepAlivePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; ++i) {
      //只需要用 KeepAliveWrapper 包装一下即可
      children.add(KeepAliveWrapper(child: Page(text: '$i')));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("KeepAlivePageView"),
      ),
      body: PageView(
        children: children,
      ),
    );
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

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}


// class Page extends StatefulWidget {
//     const Page({Key? key, required this.text}) : super(key: key);

//   final String text;

//   @override
//   State<Page> createState() => _PageState();
// }

// class _PageState extends State<Page> with AutomaticKeepAliveClientMixin{
//   @override
//   Widget build(BuildContext context) {
//      super.build(context); // 必须调用
//     print("build ${widget.text}");
//     return Center(
//       child: Text(
//         widget.text,
//         textScaleFactor: 5,
//       ),
//     );
//   }
  
//   @override
//   bool get wantKeepAlive => true;  // 是否需要缓存
// }
