import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

class HomeModel extends ChangeNotifier {
  int _page = 0;
  int get page => _page;
  int advLen = 0;
  // List<Map<String, dynamic>> get  = _data;

  // MyChangeNotifier(this._data);

  barPage(int value) {
    _page = value;
    notifyListeners(); //要更新UI记得调用这个方法
  }
}
