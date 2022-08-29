import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:github_app/common/global.dart';
import 'package:github_app/models/index.dart';

class GithubApi {
  GithubApi([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;

  static Dio dio =
      Dio(BaseOptions(baseUrl: "https://api.github.com/", headers: {
    HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
        "application/vnd.github.symmetra-preview+json"
  }));

  static init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;
    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // client.findProxy = (uri) {
        //   return 'PROXY 192.168.50.154:8888';
        // };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 登录
  Future<User> login(String username, String password) async {
    var basic = "Basic${base64.encode(utf8.encode("$username:$password"))}";
    var response = await dio.get("/user",
        options: _options.copyWith(headers: {
          HttpHeaders.authorizationHeader: basic
        }, extra: {
          "noCache": true,
        }));
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    Global.netCache.cache.clear();
    Global.profile.token = basic;
    return User.fromJson(response.data);
  }

  //获取用户项目列表
  Future<List<Repo>> getRepos(
      {Map<String, dynamic>? query, refresh = false}) async {
    if (refresh) {
      _options.extra?.addAll({"refresh": true, "list": true});
    }
    var response = await dio.get<List>("user/repos",
        queryParameters: query, options: _options);
    return response.data!.map((e) => Repo.fromJson(e)).toList();
  }
}
