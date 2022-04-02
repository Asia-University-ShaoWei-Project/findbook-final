import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'product/product.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/models/search_model.dart';

class IndexLoading extends StatelessWidget {
  final bookIndex;
  final subTitle = ["ISBN", "Pages"];
  final tilewidth = [100.0, 50.0];
  IndexLoading({this.bookIndex});

  // Future init(context) async {
  //   print('開始請求資料');
  //   final response =
  //       await http.get('http://210.70.80.111/106021095/index.json');
  //   if (response.statusCode == 200) {
  //     final resData = convert.jsonDecode(response.body);
  //     print('HTTP 請求完成');
  //     if (resData["status"]) {
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Product(
  //               itemData: resData,
  //             ),
  //           ));
  //     } else {
  //       Navigator.pop(context);
  //     }
  //   } else {
  //     Navigator.pop(context);
  //   }
  // }
// final myModelnotifier;
  @override
  Widget build(BuildContext context) {
    final searchModelNotify = Provider.of<SearchModel>(context, listen: false);
    Future.delayed(Duration(milliseconds: 500), () async {
      final response =
          // await http.get('http://210.70.80.111/106021095/json/index.json');
          await http.get('http://192.168.43.224:8000/s/product/?store=${searchModelNotify.searchSort['from']}&index=$bookIndex');
      if (response.statusCode == 200) {
        final resData = convert.jsonDecode(response.body);
        print('HTTP 請求完成');
        if (resData["status"]) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Product(
                  itemData: resData,
                  bookIndex: bookIndex,
                ),
              ));
        } else {
          print('1');
          Navigator.pop(context);
        }
      } else {
          print('response.statusCode: ${response.statusCode}');

        Navigator.pop(context);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.grey),
        actions: [
          Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: true,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 35),
                        height: 230.0,
                        width: 180,
                        color: Colors.white,
                      ),
                    ),
                    Divider(thickness: 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    Divider(thickness: 3),
                    Column(
                        children: List.generate(
                      2,
                      (index) => labelInfo(index),
                    )),
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[350],
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
              ), // 也可控件一边圆角大小

              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                    ),
                    Text(
                      "商品資訊",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          letterSpacing: 3.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget labelInfo(int index) => ListTile(
        // isThreeLine: true,
        leading: Icon(
          Icons.ac_unit_rounded,
          color: Colors.black,
        ),
        // leading: Text(img, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        title: Padding(
          padding: const EdgeInsets.only(right: 100.0),
          child: Container(
            height: 15.0,
            color: Colors.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(right: 250.0),
          child: Container(
            height: 15.0,
            width: 50,
            color: Colors.white,
          ),
        ),
        enabled: false,
      );
}
