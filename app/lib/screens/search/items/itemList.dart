import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart';

import 'package:myFirst/models/search_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:like_button/like_button.dart';

import 'package:myFirst/screens/search/indexLoaing.dart';

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  // static const List durations = [50, 100, 150, 200, 250]; // animation seconds
  // final controller;
  int tmpINT = 0;
  bool hideTopBtnBool = true;
  ScrollController _scrollController;
  final Map _tileTitle = {
    "title": "書名",
    "date": "日期",
    "price": "價格",
    "author": "作者",
    "pub": "出版社"
  };
  final List<Widget> _dailogContentWidget = [
    Divider(height: 2, thickness: 1),
    SizedBox(height: 10)
  ];
  final Map _storeImg = {
    'books': Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [BoxShadow()],
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        // height: 24,
        // width: 24,
        child: Image.asset('assets/images/bookStore/books.png')),
    'sanmin': Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [BoxShadow()],
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        // height: 24,
        // width: 24,
        child: Image.asset('assets/images/bookStore/sanmin.png')),
    'eslite': Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [BoxShadow()],
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        // height: 24,
        // width: 24,
        child: Image.asset('assets/images/bookStore/eslite.png')),
    'kingstone': Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [BoxShadow()],
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        // height: 24,
        // width: 24,
        child: Image.asset('assets/images/bookStore/kingstone.png'))
  };
  // ItemList({this.controller});

  @override
  Widget build(BuildContext context) {
    // final searchNotify = Provider.of<SearchModel>(context);
    _scrollController = ScrollController();
    print('build itemList');

    return Selector<SearchModel, List>(
        selector: (context, searchModel) => searchModel.data,
        builder: (context, data, child) => data.isNotEmpty
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Theme.of(context).appBarTheme.color,
                width: double.infinity,
                child: Selector<SearchModel, Map>(
                  selector: (context, searchModel) => searchModel.searchSort,
                  builder: (context, searchSort, child) => Selector<
                          SearchModel, Function>(
                      selector: (context, searchModel) =>
                          searchModel.dataProcess,
                      builder: (context, dataProcess, child) {
                        Future<Map> doSearchItem() async {
                          var dio = Dio();
                          print('next page');
                          print("http://192.168.43.224:8000/s/items/?page=${searchSort['page']}&key=${searchSort['title']}&store=${searchSort['from']}&sort=${searchSort['sort']}&method=${searchSort['method']}&type=${searchSort['type']}");
                          Map resoult = {'statusCode': null, 'data': null};
                          final response = await dio
                              .get(
                                "http://192.168.43.224:8000/s/items/?page=${searchSort['page']}&key=${searchSort['title']}&store=${searchSort['from']}&sort=${searchSort['sort']}&method=${searchSort['method']}&type=${searchSort['type']}",
                                // "http://210.70.80.111/106021095/json/kingstoneMult.json",
                                // "http://210.70.80.111/106021095/json/items1123.json",
                                // queryParameters: {"id": 12, "name": "wendu"}
                              )
                              .timeout(const Duration(seconds: 10));
                          resoult['statusCode'] = response.statusCode;
                          if (response.statusCode == 200)
                            dataProcess(response.data);
                          return resoult;
                        }

                        return Selector<SearchModel, bool>(
                          selector: (context, searchModel) =>
                              searchModel.nextRequestBool,
                          builder: (context, nextRequestBool, child) =>
                              Selector<SearchModel, bool>(
                            selector: (context, searchModel) =>
                                searchModel.hideTopButtonBool,
                            builder: (context, hideTopButtonBool, child) =>
                                Selector<SearchModel, Function>(
                              selector: (context, searchModel) =>
                                  searchModel.topBtnEvent,
                              builder: (context, topBtnEvent, child) =>
                                  Selector<SearchModel, Map>(
                              selector: (context, searchModel) =>
                                  searchModel.searchSort,
                              builder: (context, searchSort, child) => NotificationListener<ScrollNotification>(
                                onNotification: (scrollNoti) {
                                    if (hideTopButtonBool &&
                                        scrollNoti.metrics.extentBefore > 250) {
                                      print('1');
                                      topBtnEvent(hide: false);
                                    } else if (!hideTopButtonBool &&
                                        scrollNoti.metrics.extentBefore < 251) {
                                      print('2');

                                      topBtnEvent(hide: true);
                                    }
                                    if (scrollNoti.metrics.extentAfter < 150 &&
                                        nextRequestBool) {
                                      print('3');

                                      nextRequestBool = false;
                                      searchSort['page']+=1;
                                      
                                      print('go search');
                                      doSearchItem();
                                    }
                                    // double progress = notification.metrics.pixels /
                                    //     notification.metrics.maxScrollExtent;
                                    // print("${notification.metrics.extentAfter<150}");
                                    // print(notification.metrics.maxScrollExtent)        ;
                                    //重新构建
                                    // setState(() {
                                    //   _progress = "${(progress * 100).toInt()}%";
                                    // });
                                    // print(
                                    //     "BottomEdge: ${notification.metrics.extentAfter == 0}");
                                    //return true; //放开此行注释后，进度条将失效
                                },
                                child: Stack(
                                    children: [
                                      ListView.builder(
                                        controller: _scrollController,
                                        itemCount: data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              print('onTap');
                                            },
                                            child: _listIemt(context,
                                                jsonData: data[index]),
                                          );
                                        },
                                      ),
                                      Positioned(
                                          right: 20,
                                          bottom: 50,
                                          child: hideTopButtonBool
                                              ? SizedBox()
                                              : FloatingActionButton(
                                                  backgroundColor:
                                                      Color(0xFFBBBBBB),
                                                  // onPressed: (){
                                                  //   scrollController.position.
                                                  // },
                                                  onPressed: () {
                                                    _scrollController.animateTo(
                                                        0.0,
                                                        duration: Duration(
                                                            milliseconds: 800),
                                                        curve: Curves.easeIn);
                                                  },
                                                  child: Icon(Icons.eject),
                                                ))
                                    ],
                                ),
                              ),
                                  ),
                            ),
                          ),
                        );
                      }),
                ))
            : Center(
                child: Text(
                '上未搜尋',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ))
        // Consumer<SearchModel>(builder: (buildContext, localNotify, widget) { return

        );
  }

  _listIemt(BuildContext context, {Map jsonData}) {
    List<Widget> existList = [];
    if (jsonData['exist'].isNotEmpty) {
      jsonData['exist'].forEach((k, v) {
        if (v != null) {
          existList.add(_storeImg[k]);
        }
      });
    }
    return GestureDetector(
      onLongPress: () =>
          showBookInfoDialog(context, exist: existList, jsonData: jsonData),
      onTap: () {
        // searchNotify.myTag = jsonData["index"];
        // searchNotify.myText = jsonData["title"];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndexLoading(bookIndex: jsonData['index'])));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.25, color: Colors.grey),
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: CachedNetworkImage(
                  height: 90,
                  imageUrl:
                      // "https://cdn.kingstone.com.tw/book/images/product/${jsonData["img"]}",
                      jsonData['imgURL'] ?? '',
                  placeholder: (BuildContext context, String url) =>
                      const Center(
                    // child: CircularProgressIndicator(),
                    child: Icon(
                      Icons.photo_size_select_actual,
                      color: Colors.grey,
                    ),
                  ),
                  errorWidget:
                      (BuildContext context, String url, dynamic error) =>
                          const Center(
                              child: Icon(
                    Icons.error,
                    color: Colors.grey,
                  )),
                  fadeOutDuration: const Duration(seconds: 1),
                  fadeInDuration: const Duration(seconds: 2),
                  // placeholder: ,
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 40,
                          child: Text(jsonData["title"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 7.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0))),
                          child: Text(jsonData["date"]??"---",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline4),
                        ),
                        existList.isNotEmpty
                            ? Container(
                                height: 20, child: Row(children: existList))
                            : SizedBox(
                                height: 20,
                              )
                      ]),
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  iconSize: 20,
                  onPressed: () => showBookInfoDialog(context,
                      exist: existList, jsonData: jsonData),
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ),
          ],
        ),
      ),
      // )
    );
  }

  // scrollToTop() {

  // }

  void showBookInfoDialog(BuildContext context,
          {List exist, dynamic jsonData}) =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            List<Widget> content = [..._dailogContentWidget];
            jsonData.forEach((k, v) {
              if (_tileTitle.containsKey(k))
                content.add(ListTile(
                    leading: Text(
                      _tileTitle[k],
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    title:
                        Text(v, style: Theme.of(context).textTheme.headline2)));
            });
            // jsonData.forEach((k, v)=>print("key: $k, value: $v"));
            return SimpleDialog(
                titlePadding: EdgeInsets.only(top: 32),
                title: Center(child: Text("詳細資訊")),
                contentPadding: EdgeInsets.all(32),
                children: [
                  exist.isNotEmpty
                      ? Container(height: 36, child: Row(children: exist))
                      : SizedBox(
                          height: 24,
                        ),
                  ...content
                ]);
          });
  // Future<bool> onLikeButtonTapped(bool isLiked) async {
  //   /// send your request here
  //   // final bool success= await sendRequest();

  //   /// if failed, you can do nothing
  //   // return success? !isLiked:isLiked;

  //   return !isLiked;
  // }

}
