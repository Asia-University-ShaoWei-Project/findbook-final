import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget storeIcon(path) {
  return CircleAvatar(
    backgroundImage: AssetImage("assets/images/bookStore/$path.png"),
    radius: 15,
  );
}

Widget svgIcon(path) => SvgPicture.asset(
      "assets/svg/$path.svg",
      width: 20,
      // color: Colors.amber,
    );

class SearchModel extends ChangeNotifier {
  // int _counter = 0;
  // int get counter => _counter;

  //------------searchBox--------------
  String _keyword = "";
  String get keyword => _keyword;

  //------------product--------------
  int _itemFrom = 0; // 0:books, 1:sanmin, 2:kingStone
  int _currentPage = 1; // img page count

  Map<String, dynamic> _indexData;

  int get itemFrom => _itemFrom;
  int get currentPage => _currentPage;
  Map get indexData => _indexData;

  switchImagePage(index) {
    // image preview switch listener
    _currentPage = index + 1;
    notifyListeners();
  }

  //------------json--------------
  List _data = [];
  List get data => _data;
  bool _item_loading_check = true;
  bool get item_loading_check => _item_loading_check;
  int count = 0;

  int _reqStatus = 0;
  int get reqStatus => _reqStatus;

  searchResult(Map reqData) {
    count += 1;
    dynamic reqJson = reqData['json'];
    _reqStatus = reqData['status'];
    try {

      if (reqJson != null && reqJson["status"]) {
        print('http search success');
        // _data = jsonData["info"];
        _data += reqJson["info"];
        return true;
        // notifyListeners(); //要更新UI记得调用这个方法
      }
    } catch (e) {
      print('http search error');
      print(e);
      print(reqJson);
      return false;
    }
    print('tail');
    _item_loading_check = true;
    print('check -> $_item_loading_check');
    print(count);
    return false;
  }

  //------------product dialog--------------
  Map _seleTags={}; // img page count
  int _dialogPageCount=0; // img page count
  Map get seleTags => _seleTags;
  int get dialogPageCount => _dialogPageCount;
  Icon bookStatus;
  initDialog() {
    _seleTags = {'city': '', 'univ': ''};
    _dialogPageCount = 0;
    // notifyListeners();
  }
  changeDialogPage(value) {
    _dialogPageCount = value;
    notifyListeners();
  }
  printValue() {
    print('_seleTags: $_seleTags');
    print('_dialogPageCount: $_dialogPageCount');
  }
  checkUnivBookStatus(data) {
    // _dialogPageCount = value;
    notifyListeners();
  }

  //------------option--------------
  final List<int> sele = [0, 0, 1];
  final List<String> title = [
    tr("S.from_method.title.from"),
    tr("S.from_method.title.method"),
    tr("S.from_method.title.book")
  ]; // 標題文字(FROM METHOD)

  List<List> optionData = [
    ["BOOKS", "SANMIN"],
    ["ALL", "TITLE", "ISBN", "AUTHOR", "PUBLISH"],
    ["ALL", "BOOK", "EBOOK"],
  ];
  final Map optionIcon = {
    "ALL": svgIcon("SP/all"),
    "BOOKS": storeIcon("books"),
    "SANMIN": storeIcon("sanmin"),
    // "TITLE": SvgPicture.asset("assets/images/SVG/SP/title.svg"),
    "TITLE": Icon(Icons.title),
    "ISBN": svgIcon("SP/isbn"),
    "AUTHOR": svgIcon("SP/author"),
    "PUBLISH": svgIcon("SP/publish"),

    "BOOK": svgIcon("SP/book"),
    "EBOOK": svgIcon("SP/ebook"),
    // "":storeIcon("books"),
  };

  fromOptions(itemIndex, optionIndex) {
    sele[itemIndex] = optionIndex;
    notifyListeners();
  }
}
