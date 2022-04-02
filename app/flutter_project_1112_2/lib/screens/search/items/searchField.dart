import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/models/persion_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../endDrawer.dart';
import '../../search.dart';
import 'package:myFirst/models/search_model.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  var input = TextEditingController();

  final searchNotifier;
  bool checkData = false;
  var myModelnotifier;
  SearchField({this.searchNotifier});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    void _openEndDrawer() {
      _scaffoldKey.currentState.openEndDrawer();
    }

    void _closePage() {
      Navigator.of(context).pop();
    }

    // int count;

    myModelnotifier = Provider.of<SelfModel>(context, listen: false);
    // searchNotifier = Provider.of<MyModel>(context, listen: false);
    // return Consumer<SearchModel>(builder: (buildContext, notifier, widget) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "搜尋",
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [],
        ),
        endDrawer: SearchEndDrawer(myNotifier: searchNotifier),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Consumer<SearchModel>(
                          builder: (buildContext, localNotify, widget) =>
                              TextField(
                            controller: input,
                            autofocus: true,
                            onSubmitted: (value) async {
                              // print(myModelnotifier.isLogin);
                              checkData = localNotify
                                  .searchResult(await fetchAlbum(value));

                              // await myModelnotifier.connectDio(
                              //     method: "get",
                              //     url: "106021095/json/kingstoneMult.json",
                              //     data: {"key": value},
                              //     reqFunc: () => print("search start get json"),
                              //     resFunc: (data) => searchNotifier.data = data);
                              if (checkData) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => SearchMain()),
                                );
                              }
                            },
                            // textInputAction: TextInputAction.done,
                            style: TextStyle(
                                color: Colors.black, letterSpacing: 1.5),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // icon: Icon(
                              //   Icons.search,
                              //   color: Colors.grey[700],
                              // ),
                              hintText: "search here",
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () => _openEndDrawer(),
                      icon: Icon(Icons.sort),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   // color: Colors.white,
            //   child: Container(
            //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     padding: EdgeInsets.all(5),
            //     // decoration: BoxDecoration(
            //     //   // color: Colors.white,
            //     //   boxShadow: [
            //     //     BoxShadow(),
            //     //   ],
            //     //   borderRadius: BorderRadius.circular(10.0),
            //     // ),
            //     child:
            //   ),
            // ),
            Divider(
              height: 1,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Selector<SearchModel, int>(
                      selector: (_, viewModel) => viewModel.reqStatus,
                      builder: (buildContext, reqStatus, widget) {
                        print('msg request status -> $reqStatus');
                        String msg = "";
                        switch (reqStatus) {
                          case 404:
                            msg = "連線失敗";
                            break;
                          // case 404:
                          //   msg = "連線失敗";
                          //   break;
                        }
                        return Text(
                          msg,
                          maxLines: 1,
                        );
                      })),
            ),
            Divider(
              height: 1,
            ),
            Expanded(
              child: ListView(
                children: [
                  // ---- Recent ----
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Consumer<SelfModel>(
                          builder: (buildContext, notifier, widget) {
                        bool check = notifier.searchHistory.isNotEmpty;
                        return Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Recent',
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                OutlineButton(
                                  onPressed: () {
                                    print('Received click');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                      Text(
                                        'Clear all',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            check
                                ? Column(
                                    children: List.generate(
                                        notifier.searchHistory.length, (index) {
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        leading: Icon(
                                          Icons.access_time,
                                          // color: Colors.grey[400],
                                        ),
                                        title: Text(
                                            notifier.searchHistory[index]
                                                ["key"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1),
                                        subtitle: Text(
                                            "20${notifier.searchHistory[index]["date"]}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2),
                                        trailing: Icon(Icons.clear),
                                        onTap: () {
                                          searchNotifier.keyword = notifier
                                              .searchHistory[index]["key"];
                                          searchNotifier.notifyListeners();
                                          print(
                                              "keyword : ${searchNotifier.keyword}");
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }),
                                  )
                                : Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 60.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.info,
                                            // color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Text("Empty!",
                                                style: TextStyle(
                                                    // color: Colors.grey
                                                    )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            check
                                ? Center(
                                    // More history text button
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              "More",
                                              style: TextStyle(
                                                  color: Color(0xFF2196F3)),
                                            ))),
                                  )
                                : SizedBox()
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
    // });
    // Scaffold(
    //       backgroundColor: Colors.white,
    //       drawer: NavDrawer(),
    //       appBar: AppBar(
    //         title: SearchBox(
    //           searchContext: context,
    //         ),
    //         backgroundColor: Colors.white,
    //         iconTheme: new IconThemeData(color: Colors.black),
    //         elevation: 0,
    //       ));
  }
}

Future fetchAlbum(String value) async {
  var dio = Dio();

  final response = await dio
      .get(
        // "http://192.168.43.159:8000/s/test/",
        "http://210.70.80.111/106021095/json/kingstoneMult.json",

        // queryParameters: {"id": 12, "name": "wendu"}
      )
      .timeout(const Duration(seconds: 10));
  if (response.statusCode == 200) {
    return {'status': response.statusCode, 'json': response.data};
  } else {
    return {
      'status': response.statusCode,
      'json': null,
    };
  }
}
