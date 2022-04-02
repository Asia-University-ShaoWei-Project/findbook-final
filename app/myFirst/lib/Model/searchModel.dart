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
  "assets/images/SVG/$path.svg", 
  width: 20, 
  // color: Colors.amber,
);
class SearchModel extends ChangeNotifier {
  // int _counter = 0;
  // int get counter => _counter;

  //------------searchBox--------------
  String keyword="";
  


  //------------json--------------
  List<dynamic> data;
  int len = 0;
  searchResult(jsonData) {
    data = jsonData;
    len = data.length;
    notifyListeners(); //要更新UI记得调用这个方法
  }
  //------------product--------------
  String myTag;
  String myText;
  //------------option--------------
  final List<int> sele = [0, 0, 1];
  final List<String> title = [tr("S.from_method.title.from"),tr("S.from_method.title.method"),tr("S.from_method.title.book")]; // 標題文字(FROM METHOD)

  List<List> optionData = [["BOOKS", "SANMIN"],["ALL", "TITLE", "ISBN", "AUTHOR", "PUBLISH"],["ALL", "BOOK", "EBOOK"],];
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
