import 'package:flutter/material.dart';
import 'package:flutter_getx_app/states/count.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final CountController c = Get.put(CountController());

    return Scaffold(
        appBar: AppBar(
          //导航栏
          title: Obx(() => Text("clicks: ${c.count}")),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () => Get.to(const Other()),
              child: const Text('go to other')),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: c.increment,
            child: const Icon(Icons.add)));
  }
}

class Other extends StatelessWidget {
  const Other({super.key});

  @override
  Widget build(BuildContext context) {
    final CountController c = Get.put(CountController());

    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
