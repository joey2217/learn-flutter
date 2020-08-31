import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/native_route_page.dart';

var rootHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return HomePage();
});

var nativeHandler = Handler(
  handlerFunc: (context, parameters) {
    return NativeRoutePage();
  },
);
