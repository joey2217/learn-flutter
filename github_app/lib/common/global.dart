import 'package:flutter/material.dart';
import 'package:github_app/common/net_cache.dart';
import 'package:github_app/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static late SharedPreferences _sharedPreferences;
  static Profile profile = Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();
  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static Future init() async {}
}
