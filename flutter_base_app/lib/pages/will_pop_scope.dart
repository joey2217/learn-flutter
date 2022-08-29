import 'package:flutter/material.dart';

class WillPopScopePage extends StatefulWidget {
  const WillPopScopePage({Key? key}) : super(key: key);

  @override
  State<WillPopScopePage> createState() => _WillPopScopePageState();
}

class _WillPopScopePageState extends State<WillPopScopePage> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("WillPopScopePage"),
          ),
          body: const Center(
            child: Text("1秒内连续按两次返回键退出"),
          ),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
