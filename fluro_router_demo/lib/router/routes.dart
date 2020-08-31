import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = '/';
  static String nativePath = '/native';

  static void configureRoutes(Router router) {
    router.notFoundHandler =
        Handler(handlerFunc: (context, parameters) => Text('NOT FOUND!'));

    router.define(root, handler: rootHandler);
    router.define(nativePath, handler: nativeHandler);
  }
}
