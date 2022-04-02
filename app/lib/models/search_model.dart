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
  bool _nextRequestBool = true;
  bool get nextRequestBool => _nextRequestBool;
  int count = 0;
  
  // top button
  bool _hideTopButtonBool = true;
  bool get hideTopButtonBool => _hideTopButtonBool;
  topBtnEvent({bool hide}){
    _hideTopButtonBool = hide;
    notifyListeners();
  }

  // clear item data
  emptyData(){
    _data = [];
    notifyListeners();
  }

  // data processing & save to _data variable
  dataProcess(Map itemJson) {
    count += 1; 
    try {
      if (itemJson != null && itemJson["status"]) {
        print('http search success');
        // _data = jsonData["info"];
        _data += itemJson["info"];
      }
    } catch (e) {
      print('http search error');
      print(e);
      print(itemJson);
    }
    print('tail');
    _nextRequestBool = true;
    print('check -> $_nextRequestBool');
    print(count);
    notifyListeners();
  }
  // sort
  Map _searchSort={
    'from':'books',
    'title':null,
    'method':'all',
    'sort':'default',
    'type':'all',
    'page':1,
  };
  Map get searchSort => _searchSort;

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
  final List<int> sele = [0, 0, 0, 1];
  final List<String> title = [
    tr("S.from_method.title.from"),
    tr("S.from_method.title.method"),
    "Sort",
    tr("S.from_method.title.book")
  ]; // 標題文字(FROM METHOD)

  List<List> optionData = [
    ["Books", "Sanmin","KingStone","Eslite"],
    ["All", "Title", "ISBN", "Athor", "Publish"],
    ["Base", "Date", "Date2", "Price", "Price2"],
    ["All", "Book", "e-Book"],
  ];
  // final Map optionIcon = {
  //   "ALL": svgIcon("SP/all"),
  //   "BOOKS": storeIcon("books"),
  //   "SANMIN": storeIcon("sanmin"),
  //   // "TITLE": SvgPicture.asset("assets/images/SVG/SP/title.svg"),
  //   "TITLE": Icon(Icons.title),
  //   "ISBN": svgIcon("SP/isbn"),
  //   "AUTHOR": svgIcon("SP/author"),
  //   "PUBLISH": svgIcon("SP/publish"),

  //   "BOOK": svgIcon("SP/book"),
  //   "EBOOK": svgIcon("SP/ebook"),
  //   // "":storeIcon("books"),
  // };

  fromOptions(itemIndex,int optionIndex) {
    switch (itemIndex) {
      case 0:
        searchSort['from']=['books','sanmin','kingstone', 'eslite'][optionIndex];
        
        break;
      case 1:
        searchSort['method']=[
          'all',
          'au',
          'pu',
          'isbn'
          ][optionIndex];
        
        break;
      case 2:
        searchSort['sort']=['default','dateN2O','dateO2N','priceH2L','priceL2H'][optionIndex];
        break;
      case 3:
        searchSort['type']=['all'][optionIndex];
        break;
      default:
    }
    print("itemIndex:$itemIndex, optionIndex:$optionIndex");
    sele[itemIndex] = optionIndex;
    notifyListeners();
  }
}
