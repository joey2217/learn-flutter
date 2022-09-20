import 'package:flutter/widgets.dart';

class CountModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count += 1;
    notifyListeners();
  }

  void minus() {
    _count -= 1;
    notifyListeners();
  }
}
