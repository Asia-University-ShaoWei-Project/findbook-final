import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/Model/myModel.dart';
import '../searchWidget/endDrawer.dart';

// ignore: must_be_immutable
class SearchBox2 extends StatelessWidget {
  var input = TextEditingController();

  final searchNotifier;
  var myModelnotifier;
  SearchBox2({this.searchNotifier});
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

    myModelnotifier = Provider.of<MyModel>(context, listen: false);
    // searchNotifier = Provider.of<MyModel>(context, listen: false);
    // return Consumer<SearchModel>(builder: (buildContext, notifier, widget) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: SearchEndDrawer(myNotifier: searchNotifier),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () => _openEndDrawer(),
                        // onPressed: () => {},
                        icon: Icon(Icons.dehaze),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: TextField(
                            controller: input,
                            autofocus: true,
                            onSubmitted: (value) async {
                              // print(myModelnotifier.isLogin);
                              await myModelnotifier.connectDio(
                                  method: "get",
                                  url: "106021095/myjson.json",
                                  data: {"key": value},
                                  reqFunc: () =>
                                      print("search start get json"),
                                  resFunc: (data) =>
                                      searchNotifier.data = data);
                              // await fetchAlbum(value);
                              Navigator.of(context).pop(context);
                            },
                            // textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                letterSpacing: 1.5),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // icon: Icon(
                              //   Icons.search,
                              //   color: Colors.grey[700],
                              // ),
                              hintText: "search here",
                              hintStyle: TextStyle(
                                  // color: Colors.grey[700],
                                  letterSpacing: 1.5),
                            ),
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
                ),
              ),
              Divider(
                height: 1,
              ),
              Expanded(
                child: ListView(
                  children: [
                    // ---- Test ----
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // O(child: Icon(Icons.delete_sweep, size: 30,)),
                          IconButton(
                            onPressed: _closePage,
                            icon: Icon(Icons.arrow_back),
                          ),
                          // Icon(Icons.edit),
                          RaisedButton.icon(
                            color: Colors.transparent,
                            splashColor: Colors.transparent,
                            elevation: 0,
                            icon: Icon(Icons.delete),
                            label: Text("Clear all"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),

                    // ---- Recent ----
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Consumer<MyModel>(
                          builder: (buildContext, notifier, widget) {
                        bool check = notifier.searchHistory.isNotEmpty;
                        return Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recent'),
                            check
                                ? Column(
                                    children: List.generate(
                                        notifier.searchHistory.length, (index) {
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        leading: Icon(
                                          Icons.access_time,
                                          color: Colors.grey[400],
                                        ),
                                        title: Text(notifier
                                            .searchHistory[index]["key"]),
                                        subtitle: Text(
                                            "20${notifier.searchHistory[index]["date"]}"),
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
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Text("Empty!",
                                                style: TextStyle(
                                                    color: Colors.grey)),
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
                  ],
                ),
              )
            ],
          ),
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
