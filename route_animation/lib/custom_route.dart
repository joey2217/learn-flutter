import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget page;

  CustomRoute(this.page)
      : super(
          transitionDuration: const Duration(milliseconds: 1500),
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            //缩放路由动画
            // return FadeTransition(
            //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            //     parent: animation,
            //     curve: Curves.fastOutSlowIn,
            //   )),
            //   child: child,
            // );
            //旋转+缩放路由动画
            // return RotationTransition(
            //   turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            //     parent: animation,
            //     curve: Curves.fastOutSlowIn,
            //   )),
            //   child: ScaleTransition(
            //     scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            //         parent: animation, curve: Curves.fastOutSlowIn)),
            //     child: child,
            //   ),
            // );
            //左右滑动路由动画
            return SlideTransition(
              position:
                  Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
              child: child,
            );
          },
        );
}
