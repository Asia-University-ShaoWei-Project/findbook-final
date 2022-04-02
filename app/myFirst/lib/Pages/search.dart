import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SearchWidget/searchBox2.dart';
import 'SearchWidget/categoryList.dart';
import '../Pages/SearchWidget/itemList.dart';

import 'package:myFirst/Model/searchModel.dart';

// import '../test.dart';
import 'package:dio/dio.dart';
import 'searchWidget/endDrawer.dart';

class SearchPage extends StatelessWidget {
  final controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SearchPage({@required this.controller});

  @override
  Widget build(BuildContext context) {
    void _openEndDrawer() => _scaffoldKey.currentState.openEndDrawer();
    // ignore: unused_element
    void _closePage() => Navigator.of(context).pop();
    print('build Search');

    return ChangeNotifierProvider(
      create: (_) => SearchModel(),
      // create: (_) => searchNotifier,
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: SearchEndDrawer(),
        body: Column(
          children: [
            // ----search box----
            Selector<SearchModel, dynamic>(
                selector: (context, viewModel) => viewModel,
                shouldRebuild: (pre, next) => pre != next,
                builder: (context, notifier, child)
                    // Consumer<SearchModel>(builder: (buildContext, notifier, widget)
                    =>
                    GestureDetector(
                        // onTap: () => Navigator.pushNamed(context, '/search/box'),
                        // onTap: () => Navigator.of(context).pushNamed('/search/box'),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchBox2(searchNotifier: notifier))),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  // color: Colors.grey[400].withOpacity(0.5),
                                  // offset: Offset(1, 1), //X, Y
                                  // blurRadius: 2,
                                  // spreadRadius: 2,
                                  ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  _openEndDrawer();
                                },
                                icon: Icon(Icons.dehaze),
                              ),
                              // Text(searchNotifier.keyword, style: TextStyle(fontSize: 18),),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    "searchNotifier11111111111111111111111111",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                        letterSpacing: 1.2,
                                        color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                              IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.mic),
                              ),
                            ],
                          ),
                        ))),
            // ---- category ----
            CategoryList(),
            // ---- item container ----
            Expanded(
              child: Consumer<SearchModel>(
                builder: (context, localNotify, child) => Stack(
                  children: [
                    ItemList(controller: controller),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: () async {
                            localNotify.searchResult(await fetchAlbum("value"));
                            await fetchAlbum("value");
                          },
                          icon: Icon(Icons.add)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future fetchAlbum(String value) async {
  var dio = Dio();

  final response = await dio
      .get(
        // "http://192.168.43.159:8000/s/test/",
        "http://210.70.80.111/106021095/myjson.json", // school url get json

        // queryParameters: {"id": 12, "name": "wendu"}
      )
      .timeout(const Duration(seconds: 10));
  if (response.statusCode == 200) {
    return response.data["data"];
  } else {
    return null;
  }
}
