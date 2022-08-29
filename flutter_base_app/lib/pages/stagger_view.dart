import 'package:flutter/material.dart';

class StaggerView extends StatefulWidget {
  const StaggerView({Key? key}) : super(key: key);

  @override
  State<StaggerView> createState() => _StaggerViewState();
}

class _StaggerViewState extends State<StaggerView>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print(TickerCanceled);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stagger"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _playAnimation();
                },
                child: const Text("Start")),
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              child: StaggerAnimation(
                controller: _controller,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  late final Animation<double> height;
  late final Animation<EdgeInsets> padding;
  late final Animation<Color?> color;
  StaggerAnimation({Key? key, required this.controller}) : super(key: key) {
    //高度动画
    height = Tween<double>(begin: 0.0, end: 300.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.6, curve: Curves.ease),
    ));

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.6, curve: Curves.ease)));

    padding = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(left: 0.0),
      end: const EdgeInsets.only(left: 100.0),
    ).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease)));
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        width: 50.0,
        color: color.value,
        height: height.value,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}
