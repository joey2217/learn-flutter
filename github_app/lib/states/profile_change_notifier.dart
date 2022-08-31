import 'package:flutter/material.dart';
import 'package:github_app/common/global.dart';
import 'package:github_app/models/index.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

class UserModel extends ProfileChangeNotifier {
  User? get user => _profile.user;
  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;
  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User? user) {
    if (user?.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user?.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}

class ThemeModel extends ProfileChangeNotifier {
  MaterialColor get theme =>
      Global.themes.firstWhere((element) => element.value == _profile.theme,
          orElse: () => Colors.blue);

  set theme(MaterialColor color) {
    if (color != theme) {
      _profile.theme = color[500]!.value;
      notifyListeners();
    }
  }
}

class LocaleModel extends ProfileChangeNotifier {
  Locale? getLocale() {
    if (_profile.locale == null) {
      return null;
    }
    var t = _profile.locale!.split("_");
    if (t.length > 1) {
      return Locale(t[0], t[1]);
    } else {
      return Locale(t[0]);
    }
  }

  String? get locale => _profile.locale;

  set locale(String? locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
