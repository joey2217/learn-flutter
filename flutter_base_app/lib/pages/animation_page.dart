import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    // ..addListener(() {
    //   setState(() {});
    // });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animation"),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: animation,
            child: Image.network(
              "https://book.flutterchina.club/assets/img/logo.png",
            ),
            builder: (BuildContext context, Widget? child) {
              return SizedBox(
                width: animation.value,
                height: animation.value,
                child: child,
              );
            },
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

// class AnimatedImage extends AnimatedWidget {
//   const AnimatedImage({
//     Key? key,
//     required Animation<double> animation,
//   }) : super(key: key, listenable: animation);

//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>;
//     return Center(
//       child: Image.network(
//         "https://book.flutterchina.club/assets/img/logo.png",
//         width: animation.value,
//         height: animation.value,
//       ),
//     );
//   }
// }
