import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  int _page = 0;
  int get page => _page;
  int advLen = 0;
  barPage(int value) {
    _page = value;
    notifyListeners();
  }
}
