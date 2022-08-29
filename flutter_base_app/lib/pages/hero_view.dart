import 'package:flutter/material.dart';

class HeroView extends StatelessWidget {
  const HeroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            InkWell(
              child: Hero(
                tag: "avatar",
                child: ClipOval(
                    child: Image.network(
                  "https://book.flutterchina.club/assets/img/logo.png",
                  width: 50,
                )),
              ),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text("原图"),
                      ),
                      body: const HeroAnimationRoute(),
                    ),
                  );
                })));
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("点击头像"),
            )
          ],
        ),
      ),
    );
  }
}

class HeroAnimationRoute extends StatelessWidget {
  const HeroAnimationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.network(
          "https://book.flutterchina.club/assets/img/logo.png",
        ),
      ),
    );
  }
}
