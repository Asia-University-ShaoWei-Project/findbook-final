import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_svg/flutter_svg.dart';


final List<Color> optionsColors = [
  Colors.grey[400],
  Colors.orange[400],
  Colors.lightBlue[200]
];

final List<int> sele = [0, 0, 1];
final List<String> title = [
  tr("S.from_method.title.from"),
  tr("S.from_method.title.method"),
  tr("S.from_method.title.book")
];



List<List> optionData = [
  ["BOOKS", "SANMIN"],
  ["ALL", "TITLE", "ISBN", "AUTHOR", "PUBLISH"],
  ["ALL", "BOOK", "EBOOK"],
];
final Map a = {
  "All": Icon(Icons.border_all),
  
  "BOOKS": storeIcon("books"),
  "SANMIN": storeIcon("sanmin"),

  "TITLE": Icon(Icons.title),
  "ISBN": SvgPicture.asset("assets/images/SVG/SP/isbn.svg"),
  "AUTHOR": SvgPicture.asset("assets/images/SVG/SP/author.svg"),
  "PUBLISH": SvgPicture.asset("assets/images/SVG/SP/publish.svg"),

  "BOOK": SvgPicture.asset("assets/images/SVG/SP/book.svg"),
  "EBOOK": SvgPicture.asset("assets/images/SVG/SP/ebook.svg"),
  };


Widget storeIcon(path) {
  return CircleAvatar(
    backgroundImage: AssetImage("assets/images/$path.png"),
    radius: 15,
  );
}
