import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myFirst/models/search_model.dart';

class BookImgPreview extends StatefulWidget {
  int index;
  final List imgList;
  final SearchModel notify;
  BookImgPreview(
      {@required this.index, @required this.imgList, @required this.notify});

  @override
  _BookImgPreviewState createState() => _BookImgPreviewState();
}

class _BookImgPreviewState extends State<BookImgPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        elevation: 0,
        title: Container(
          // width: 60,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Text(
            '${widget.index + 1} / ${widget.imgList.length}',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return  CarouselSlider(
                  options: CarouselOptions(
                      height: height,
                      initialPage: widget.index,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, _) {
                        setState(() => widget.index = index);
                      }),
                  items: widget.imgList
                      .map((item) => Container(
                            child: Center(
                              // child: Image.network(item, fit: BoxFit.cover, height: height,)
                              child: item,
                            ),
                          ))
                      .toList(),
                

          );
        },
      ),
    );
  }
}
