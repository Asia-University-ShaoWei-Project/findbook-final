import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/models/persion_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../endDrawer.dart';
import '../../rm_page/search.dart';
import 'package:myFirst/models/search_model.dart';
import 'itemList.dart';
import 'package:myFirst/utils/showSnackBar.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  var input = TextEditingController();

  final searchNotifier;
  bool dataProcessBool = false;
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
          actions: [IconButton(icon: Icon(Icons.more), onPressed: () {})],
        ),
        endDrawer: SearchEndDrawer(myNotifier: searchNotifier),
        body: Column(
          children: [
            Container(
              color: Theme.of(context).appBarTheme.color,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Consumer<SearchModel>(
                            builder: (buildContext, localNotify, widget) =>
                                Builder(
                              builder: (context) => TextField(
                                controller: input,
                                // autofocus: true,
                                onSubmitted: (value) async {
                                  if (value.length > 0) {
                                    localNotify.searchSort['title'] = value;
                                    localNotify.searchSort['page'] = 1;
                                    // FocusScopeNode currentFocus = FocusScope.of(context);

                                    // if (!currentFocus.hasPrimaryFocus) {
                                    //   currentFocus.unfocus();
                                    // }
                                    // await Future.delayed(Duration(seconds: 1),()=> print("delay..."));
                                    // print(myModelnotifier.isLogin);
                                    // localNotify.emptyData();
                                    Map response = await doSearchItem(
                                        localNotify.searchSort);
                                    if (response['statusCode'] == 200) {
                                      localNotify.emptyData();
                                      localNotify.dataProcess(response['data']);
                                    } else {
                                      String title = "其它錯誤";
                                      switch (response['statusCode']) {
                                        case 404:
                                          title = '連線失敗';
                                          break;
                                        default:
                                          _showSnack(context,
                                              title: title,
                                              icon: Icons.priority_high);
                                      }
                                    }

                                    // await myModelnotifier.connectDio(
                                    //     method: "get",
                                    //     url: "106021095/json/kingstoneMult.json",
                                    //     data: {"key": value},
                                    //     reqFunc: () => print("search start get json"),
                                    //     resFunc: (data) => searchNotifier.data = data);
                                    // if (resoultBool) {
                                    //   Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => SearchMain()),
                                    //   );
                                    // }
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
            // Expanded(child: ItemList()),
            Selector<SearchModel, List>(
                selector: (context, searchModel) => searchModel.data,
                builder: (context, data, child) => data.isNotEmpty
                    ? Expanded(child: ItemList())
                    : Expanded(
                        child: ListView(
                          children: [
                            // ---- Recent ----
                            Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: Consumer<SelfModel>(
                                    builder: (buildContext, notifier, widget) {
                                  bool check =
                                      notifier.searchHistory.isNotEmpty;
                                  return Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Recent',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1),
                                          Builder(
                                            builder: (context) => OutlineButton(
                                              onPressed: () {
                                                showSnack2(context);
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
                                            ),
                                          )
                                        ],
                                      ),
                                      check
                                          ? Column(
                                              children: List.generate(
                                                  notifier.searchHistory.length,
                                                  (index) {
                                                return ListTile(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10.0),
                                                  leading: Icon(
                                                    Icons.access_time,
                                                    // color: Colors.grey[400],
                                                  ),
                                                  title: Text(
                                                      notifier.searchHistory[
                                                          index]["key"],
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
                                                    searchNotifier.keyword =
                                                        notifier.searchHistory[
                                                            index]["key"];
                                                    searchNotifier
                                                        .notifyListeners();
                                                    print(
                                                        "keyword : ${searchNotifier.keyword}");
                                                    Navigator.of(context).pop();
                                                  },
                                                );
                                              }),
                                            )
                                          : Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
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
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      child: Text(
                                                        "More",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF2196F3)),
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
                      )),
            Divider(
              height: 1,
            ),
          ],
        ));
  }

  // searchAlert(BuildContext context, String title) {
  //   return showBottomSheet<String>(
  //       context: context,
  //       builder: (BuildContext context) => Container(
  //             decoration: const BoxDecoration(
  //               border: Border(top: BorderSide(color: Colors.black)),
  //             ),
  //             child: ListView(
  //               shrinkWrap: true,
  //               primary: false,
  //               children: [
  //                 ListTile(title: Text(title)),
  //                 ButtonBar(
  //                   children: [
  //                     FlatButton(
  //                         onPressed: () => Navigator.pop(context),
  //                         child: Text('OK'))
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ));
  // }
  void _showSnack(context, {String title, IconData icon}) {
    print('show');
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).appBarTheme.color,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(title),
            ),
          ],
        ),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }
}

Future doSearchItem(Map searchSort) async {
  print(
      "http://192.168.43.224:8000/s/items/?page=${searchSort['page']}&key=${searchSort['title']}&store=${searchSort['from']}&sort=${searchSort['sort']}&method=${searchSort['method']}&type=${searchSort['type']}");
  var dio = Dio();
  Map resoult = {'statusCode': null, 'data': null};
  final response = await dio
      .get(
        // "http://210.70.80.111/106021095/json/kingstoneMult.json",
        // "http://210.70.80.111/106021095/json/items1123.json",
        "http://192.168.43.224:8000/s/items/?page=${searchSort['page']}&key=${searchSort['title']}&store=${searchSort['from']}&sort=${searchSort['sort']}&method=${searchSort['method']}&type=${searchSort['type']}",
        // queryParameters: {"id": 12, "name": "wendu"}
      )
      .timeout(const Duration(seconds: 10));
  resoult['statusCode'] = response.statusCode;
  if (response.statusCode == 200) resoult['data'] = response.data;
  return resoult;
}
