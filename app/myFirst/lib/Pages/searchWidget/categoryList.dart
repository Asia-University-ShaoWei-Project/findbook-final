import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selectedIndex = 0;
  List categories = [
    tr("S.categoryList.accuracy"),
    tr("S.categoryList.date"),
    tr("S.categoryList.price"),
    tr("S.categoryList.popularity"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 35.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context,index) => GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex = index;
              print('你選擇: $index');
            });
          },
          child: Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(
            //   left: 20.0,
            //   right: index== categories.length-1 ? 10.0 : 0,
            //   // bottom: 50,
            // ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 10.5, vertical: 5.0),
            decoration: BoxDecoration(
              color: index == selectedIndex
                ? Colors.black.withOpacity(0.75)
                : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey[200],
              //     spreadRadius: 2,
              //     blurRadius: 2,
              //     offset: Offset(0, 3), // changes position of shadow
              //   ),
              // ],
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 14.0, 
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5,
                color: index == selectedIndex
                ? Colors.white
                : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}