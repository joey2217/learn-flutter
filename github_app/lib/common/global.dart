import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_app/common/net_cache.dart';
import 'package:github_app/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'github_api.dart';

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

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sharedPreferences = await SharedPreferences.getInstance();
    var _profile = _sharedPreferences.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    } else {
      profile = Profile()..theme = 0;
    }
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络请求相关配置
    GithubApi.init();
  }

  // 持久化Profile信息
  static saveProfile() {
    _sharedPreferences.setString("profile", jsonEncode(profile.toJson()));
  }
}
