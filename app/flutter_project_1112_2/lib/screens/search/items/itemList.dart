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
  static const List durations = [50, 100, 150, 200, 250]; // animation seconds
  // final controller;
  final Map _tileTitle = {"title":"書名", "date":"日期","price": "價格","author": "作者","pub": "出版社"};
  final List<Widget> _dailogContentWidget = [Divider(height: 2,thickness: 1), SizedBox(height: 10)];

  // ItemList({this.controller});

  @override
  Widget build(BuildContext context) {
    print('build itemList');
    // final searchNotify = Provider.of<SearchModel>(context, listen: false);

    return Selector<SearchModel, List>(
        selector: (context, searchModel) => searchModel.data,
        shouldRebuild: (pre, next) => pre != next,
        builder: (context, data, child) {
          if (data.isNotEmpty) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // padding: EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                child: AnimationLimiter(
                  child: Selector<SearchModel, Function>(
                      selector: (context, searchModel) =>
                          searchModel.searchResult,
                      builder: (context, searchResult, child) {
                        Future fetchAlbum(String value) async {
                          var dio = Dio();
                          final response = await dio
                              .get("http://210.70.80.111/106021095/kingstoneMult.json",)
                              .timeout(const Duration(seconds: 10));
                          if (response.statusCode == 200) {
                            print('statusCode success');
                            searchResult(response.data);
                          }
                        }

                        return Selector<SearchModel, bool>(
                          selector: (context, searchModel) =>
                              searchModel.item_loading_check,
                          builder: (context, check, child) =>
                              NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification notification) {
                              if (notification.metrics.extentAfter < 150 &&
                                  check) {
                                check = false;
                                print('go search');
                                fetchAlbum('');
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
                            child: ListView.builder(
                              // controller: controller,
                              padding: EdgeInsets.all(5),
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: GestureDetector(
                                        onTap: () {
                                          print('onTap');
                                        },
                                        child: _listIemt(
                                            context, index, data[index]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                ));
          } else {
            return Center(
                child: Text(
              '上未搜尋',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ));
          }
        }
        // Consumer<SearchModel>(builder: (buildContext, localNotify, widget) { return

        );
  }

  _listIemt(context, index, jsonData) {
    // final img = Image.network(jsonData["imgURL"], width: 300);
    return GestureDetector(
      onTap: () {
        // searchNotify.myTag = jsonData["index"];
        // searchNotify.myText = jsonData["title"];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndexLoading(index: 'indexNumber')));
      },
      // child: index>5? _container(index, jsonData)
      // : FadeInRight(delay: Duration(milliseconds: 50*(index+1)), child: _container(index, jsonData),)
      // child: FadeInRight(
      //   duration: Duration(milliseconds: 300),
      //   delay: Duration(milliseconds: durations[index % 5]),
      child: Card(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://cdn.kingstone.com.tw/book/images/product/${jsonData["img"]}",
                  placeholder: (BuildContext context, String url) =>
                      const Center(
                    // child: CircularProgressIndicator(),
                    child: Icon(Icons.photo_size_select_actual),
                  ),
                  errorWidget:
                      (BuildContext context, String url, dynamic error) =>
                          const Center(child: Icon(Icons.error)),
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
                          child: Text(
                            jsonData["title"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline2
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 7.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0))),
                          child: Text(
                            jsonData["date"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(color: Colors.grey[850]),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "( 0 )",
                                          style:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            // LikeButton(
                            //   onTap: onLikeButtonTapped, //jsonData["index"]
                            //   size: 30,
                            //   circleColor: CircleColor(
                            //       start: Color(0xff00ddff),
                            //       end: Color(0xff0099cc)),
                            //   bubblesColor: BubblesColor(
                            //     dotPrimaryColor: Color(0xff33b5e5),
                            //     dotSecondaryColor: Color(0xff0099cc),
                            //   ),
                            //   likeBuilder: (bool isLiked) {
                            //     return Icon(
                            //       Icons.star, // 圖案
                            //       color: isLiked
                            //           ? Colors.yellow[600]
                            //           : Colors.grey,
                            //       size: 25,
                            //     );
                            //   },
                            //   likeCount: 0, // 次數
                            //   countBuilder:
                            //       (int count, bool isLiked, String text) {
                            //     return Text(
                            //       "( $text )",
                            //       style: TextStyle(color: Colors.grey),
                            //     );
                            //   },
                            // ),
                          ],
                        )
                      ]),
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  iconSize: 20,
                  onPressed: () => showBookInfoDialog(context, jsonData),
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
  void showBookInfoDialog(BuildContext context, dynamic jsonData) => showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Widget> content = [..._dailogContentWidget];
        jsonData.forEach((k, v) {
          if (_tileTitle.containsKey(k)) content.add(ListTile(leading: Text(_tileTitle[k]), title: Text(v)));
        });
        // jsonData.forEach((k, v)=>print("key: $k, value: $v"));
        return SimpleDialog(
          titlePadding: EdgeInsets.only(top: 32),
          title: Center(child: Text("詳細資訊")),
          contentPadding: EdgeInsets.all(32),
          children: content
        );
      });
  // Future<bool> onLikeButtonTapped(bool isLiked) async {
  //   /// send your request here
  //   // final bool success= await sendRequest();

  //   /// if failed, you can do nothing
  //   // return success? !isLiked:isLiked;

  //   return !isLiked;
  // }

}
