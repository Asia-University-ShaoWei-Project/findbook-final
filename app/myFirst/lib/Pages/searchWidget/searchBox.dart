// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/Model/searchModel.dart';

import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:easy_localization/easy_localization.dart';
// import 'package:myFirst/Pages/SearchWidget/from_method.dart';

// ignore: must_be_immutable
class SearchBox extends StatelessWidget {
  var input = TextEditingController();
  var searchNotifier;
  BuildContext searchContext;
  SearchBox({Key key, this.searchContext}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    searchNotifier = Provider.of<SearchModel>(context, listen: false);
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          // IconButton(
          //     // color: Colors.black,
          //     iconSize: 30.0,
          //     icon: Icon(Icons.apps),
          //     // icon: IconData(57773),
          //     // onPressed: () => Navigator.pushNamed(context, routeName: '/search/options')),
          //     // onPressed: ()async => await Navigator.pushNamed(searchContext, '/search/options')),
          //     onPressed: () async => await Navigator.push(
          //         searchContext, SlideRightRoute(page: SearchFromMethod()))),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(230, 230, 230, 0.85),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextField(
                controller: input,
                onSubmitted: (value) async {
                  searchNotifier.searchResult(await fetchAlbum(value));
                  await fetchAlbum(value);
                  print("SUBMITTED");
                },
                // textInputAction: TextInputAction.done,
                style: TextStyle(
                    fontSize: 14, color: Colors.black, letterSpacing: 1.5),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[700],
                  ),
                  hintText: tr("S.searchTitle"),
                  hintStyle:
                      TextStyle(color: Colors.grey[700], letterSpacing: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future fetchAlbum(String value) async {
  var dio = Dio();

  final response = await dio.get(
    // "http://192.168.43.159:8000/s/test/", 
    "http://210.70.80.111/106021095/myjson.json", // school url get json

    // queryParameters: {"id": 12, "name": "wendu"}
    )
    .timeout(const Duration(seconds: 10));

  // print('Connect http');
  // final response = await http.get(
  //     // "http://192.168.43.159:8000/s/x96y4t86vjp6gjru6/?key=$value", // from search book method
  //     // "http://192.168.43.159:8000/s/?key=$value&service=p@", // from search book method
  //     "http://210.70.80.111/106021095/myjson.json", // school url get json
  //     headers: {
  //       "Accept": "application/json",
  //     }).timeout(const Duration(seconds: 10));
  // print('Request fail -> My status is ${response.statusCode}');
  if (response.statusCode == 200) {
    // then parse the JSON.
    // print(response.data["data"]);
    return response.data["data"];
    // return json.decode(response.data)["data"];
  } else {
    return null;
    // throw Exception('Failed to load album');
  }

}

// class SlideRightRoute extends PageRouteBuilder {
//   final Widget page;
//   SlideRightRoute({this.page})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               SlideTransition(
//             position: Tween<Offset>(
//               begin: const Offset(-1, 0),
//               end: Offset.zero,
//             ).animate(animation),
//             child: child,
//           ),
//         );
// }
