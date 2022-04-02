import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:myFirst/Model/searchModel.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:like_button/like_button.dart';

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  static const List durations = [50, 100, 150, 200, 250]; // animation seconds

  final controller;
  ItemList({@required this.controller});
  @override
  Widget build(BuildContext context) {
    print('build itemList');
    // final searchNotify = Provider.of<SearchModel>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(top: 5),
      // padding: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      // color: Colors.amber,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      child: Selector<SearchModel, List>(
          selector: (context, searchModel) => searchModel.data,
          shouldRebuild: (pre, next) => pre != next,
          builder: (context, data, child) =>

              // Consumer<SearchModel>(builder: (buildContext, localNotify, widget) { return
              data != null
                  ? AnimationLimiter(
                      child: ListView.builder(
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
                                  child: _listIemt(context, index, data[index]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                      '上未搜尋',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ))),
    );
  }

  _listIemt(context, index, jsonData) {
    // final img = Image.network(jsonData["imgURL"], width: 300);
    return GestureDetector(
      onTap: () {
        // searchNotify.myTag = jsonData["index"];
        // searchNotify.myText = jsonData["title"];
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> Product())
      },
      // child: index>5? _container(index, jsonData)
      // : FadeInRight(delay: Duration(milliseconds: 50*(index+1)), child: _container(index, jsonData),)
      // child: FadeInRight(
      //   duration: Duration(milliseconds: 300),
      //   delay: Duration(milliseconds: durations[index % 5]),
      child: _container(index, jsonData),
      // )
    );
  }

  _container(index, jsonData) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400].withOpacity(0.5),
            offset: Offset(2, 3), //X, Y
            blurRadius: 3,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              height: 80,
              // padding: EdgeInsets.all(10),
              child: Hero(
                tag: jsonData["index"],
                child: CachedNetworkImage(
                  imageUrl: jsonData["imgURL"],
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
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.grey[350],
              //   )
              // color: Colors.white,
              // borderRadius: BorderRadius.all(Radius.circular(5.0)),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(1.5, 3), //X, Y
              //     blurRadius: 2,
              //     // spreadRadius: 3,
              //   ),
              // ],
              // ),
            ),
          ),
          Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        jsonData["title"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1),
                      ),
                      Text(
                        jsonData["author"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                      ),
                      Text(
                        jsonData["publish"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                      ),
                      // ClipRRect()
                      // Material()
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Text(
                          jsonData["pubDate"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey[850]),
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
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "( 0 )",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          LikeButton(
                            onTap: onLikeButtonTapped, //jsonData["index"]
                            size: 30,
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.star, // 圖案
                                color:
                                    isLiked ? Colors.yellow[600] : Colors.grey,
                                size: 25,
                              );
                            },
                            likeCount: 0, // 次數
                            countBuilder:
                                (int count, bool isLiked, String text) {
                              var color = Colors.grey;
                              return Text(
                                "( $text )",
                                style: TextStyle(color: color),
                              );
                            },
                          ),
                        ],
                      )
                    ]),
              )),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black12,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> onLikeButtonTapped(bool isLiked) async {
  /// send your request here
  // final bool success= await sendRequest();

  /// if failed, you can do nothing
  // return success? !isLiked:isLiked;

  return !isLiked;
}
