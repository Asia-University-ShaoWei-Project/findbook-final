import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _username="";
  String get username => _username;

  Future<void> getProfile() async {
    final SharedPreferences prefs = await _prefs;
    _username = prefs.getString('username');

  }
  

  //------------option--------------


  fromOptions() {
    notifyListeners();
  }
}
