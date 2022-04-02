import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() => runApp(SlidingUpPanelExample());

class SlidingUpPanelExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[200],
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.black,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SlidingUpPanel Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 95.0;
  // final List<String> imgList = [
  //   "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410.jpg&v=5f3e50aa&w=348&h=348"
  //       "https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410_bi_01.jpg&v=5f3e5ec5&w=348&h=348",
  //   "https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410_b_01.jpg&v=5f3e5ecd&w=348&h=348",
  // ];
  List<CachedNetworkImage> imgList = [
    CachedNetworkImage(
      imageUrl:
          "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410.jpg&v=5f3e50aa&w=348&h=348",
      fit: BoxFit.fitHeight,
      // "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410.jpg&v=5f3e50aa&w=180&h=180",
      placeholder: (BuildContext context, String url) => const Center(
        // child: CircularProgressIndicator(),
        child: Icon(Icons.photo_size_select_actual),
      ),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          const Center(child: Icon(Icons.error)),
      fadeOutDuration: const Duration(seconds: 1),
      fadeInDuration: const Duration(seconds: 2),
      // placeholder: ,
    ),
    CachedNetworkImage(
      imageUrl:
          "https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410_bi_01.jpg&v=5f3e5ec5&w=348&h=348",
      fit: BoxFit.fitHeight,
      // "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410.jpg&v=5f3e50aa&w=180&h=180",
      placeholder: (BuildContext context, String url) => const Center(
        // child: CircularProgressIndicator(),
        child: Icon(Icons.photo_size_select_actual),
      ),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          const Center(child: Icon(Icons.error)),
      fadeOutDuration: const Duration(seconds: 1),
      fadeInDuration: const Duration(seconds: 2),
      // placeholder: ,
    ),
    CachedNetworkImage(
      imageUrl:
          "https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410_b_01.jpg&v=5f3e5ecd&w=348&h=348",
      fit: BoxFit.fitHeight,
      // "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/84/0010868410.jpg&v=5f3e50aa&w=180&h=180",
      placeholder: (BuildContext context, String url) => const Center(
        // child: CircularProgressIndicator(),
        child: Icon(Icons.photo_size_select_actual),
      ),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          const Center(child: Icon(Icons.error)),
      fadeOutDuration: const Duration(seconds: 1),
      fadeInDuration: const Duration(seconds: 2),
      // placeholder: ,
    ),
  ];
  CarouselController buttonCarouselController = CarouselController(); // 圖片滑動

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            // parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),

          // the fab
          Positioned(
            right: 20.0,
            bottom: _fabHeight,
            child: FloatingActionButton(
              child: Icon(
                Icons.gps_fixed,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
              backgroundColor: Colors.white,
            ),
          ),

          // Positioned(
          //     top: 0,
          //     child: ClipRRect(
          //         child: BackdropFilter(
          //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //             child: Container(
          //               width: MediaQuery.of(context).size.width,
          //               height: MediaQuery.of(context).padding.top,
          //               color: Colors.transparent,
          //             )))),

          //the SlidingUpPanel Title
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "商品資訊",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                    letterSpacing: 3.0),
              ),
            ],
          ),
          SizedBox(
            height: 36.0,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                // backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: TabBar(
                    isScrollable: true,
                    indicatorWeight: 4,
                    indicatorPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    indicatorColor: Colors.blue[200],
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: "商品簡介",
                      ),
                      Tab(
                        text: "目錄",
                      ),
                      Tab(
                        text: "其它",
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    test(sc),
                    test(sc),
                    test(sc),
                  ],
                ),
              ),
            ),
          ),

          // ),
        ],
      ),
    );
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }

  Widget _body() {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.more_vert, color: Colors.black),
                onPressed: null)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListView(
            children: [
              SizedBox(height: 30),
              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.65,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    // autoPlay: true,
                    // autoPlayInterval: Duration(seconds: 1),
                    // autoPlayAnimationDuration: Duration(milliseconds: 500),
                    // autoPlayCurve: Curves.easeIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: List.generate(
                      imgList.length,
                      (index) => GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullscreenSliderDemo(
                                        initIndex: index, imgList: imgList))),
                            // onTap: () => print(item.fit),
                            child: Container(
                              child: Center(child: imgList[index]

                                  // Image.network(item, fit: BoxFit.fitHeight)
                                  ),
                            ),
                          )),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "小老百姓的戰場行動守則",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.date_range,
                    color: Colors.blue,
                  ),
                  title: Text("2020-09-21")),
              ListTile(
                  leading: SvgPicture.asset(
                    "assets/author2.svg",
                    width: 25,
                    // color: Colors.amber,
                  ),
                  title: Text("Publish")),
              ListTile(
                  leading: SvgPicture.asset(
                    "assets/user.svg",
                    width: 25,
                    color: Colors.black,
                  ),
                  title: Text("Author")),
              ListTile(
                  leading: Icon(
                    Icons.access_alarm,
                    color: Colors.blue,
                  ),
                  title: Text("Icons.access_alarm")),
              ListTile(
                  leading: Icon(
                    Icons.access_alarm,
                    color: Colors.blue,
                  ),
                  title: Text("Icons.access_alarm")),
              ListTile(
                  leading: Icon(
                    Icons.access_alarm,
                    color: Colors.blue,
                  ),
                  title: Text("Icons.access_alarm")),
            ],
          ),
        ));
  }
}

Widget test(ScrollController sc) {
  return ListView(
    controller: sc,
    children: [
      Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("About",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(
              height: 12.0,
            ),
            Text(
              """Pittsburgh is a city in the state of Pennsylvania in the United States, and is the county seat of Allegheny County. A population of about 302,407 (2018) residents live within the city limits, making it the 66th-largest city in the U.S. The metropolitan population of 2,324,743 is the largest in both the Ohio Valley and Appalachia, the second-largest in Pennsylvania (behind Philadelphia), and the 27th-largest in the U.S.\n\nPittsburgh is located in the southwest of the state, at the confluence of the Allegheny, Monongahela, and Ohio rivers. Pittsburgh is known both as "the Steel City" for its more than 300 steel-related businesses and as the "City of Bridges" for its 446 bridges. The city features 30 skyscrapers, two inclined railways, a pre-revolutionary fortification and the Point State Park at the confluence of the rivers. The city developed as a vital link of the Atlantic coast and Midwest, as the mineral-rich Allegheny Mountains made the area coveted by the French and British empires, Virginians, Whiskey Rebels, and Civil War raiders.\n\nAside from steel, Pittsburgh has led in manufacturing of aluminum, glass, shipbuilding, petroleum, foods, sports, transportation, computing, autos, and electronics. For part of the 20th century, Pittsburgh was behind only New York City and Chicago in corporate headquarters employment; it had the most U.S. stockholders per capita. Deindustrialization in the 1970s and 80s laid off area blue-collar workers as steel and other heavy industries declined, and thousands of downtown white-collar workers also lost jobs when several Pittsburgh-based companies moved out. The population dropped from a peak of 675,000 in 1950 to 370,000 in 1990. However, this rich industrial history left the area with renowned museums, medical centers, parks, research centers, and a diverse cultural district.\n\nAfter the deindustrialization of the mid-20th century, Pittsburgh has transformed into a hub for the health care, education, and technology industries. Pittsburgh is a leader in the health care sector as the home to large medical providers such as University of Pittsburgh Medical Center (UPMC). The area is home to 68 colleges and universities, including research and development leaders Carnegie Mellon University and the University of Pittsburgh. Google, Apple Inc., Bosch, Facebook, Uber, Nokia, Autodesk, Amazon, Microsoft and IBM are among 1,600 technology firms generating \$20.7 billion in annual Pittsburgh payrolls. The area has served as the long-time federal agency headquarters for cyber defense, software engineering, robotics, energy research and the nuclear navy. The nation's eighth-largest bank, eight Fortune 500 companies, and six of the top 300 U.S. law firms make their global headquarters in the area, while RAND Corporation (RAND), BNY Mellon, Nova, FedEx, Bayer, and the National Institute for Occupational Safety and Health (NIOSH) have regional bases that helped Pittsburgh become the sixth-best area for U.S. job growth.
                        """,
              softWrap: true,
            ),
          ],
        ),
      ),
    ],
  );
}

// 圖片預覽頁面
class FullscreenSliderDemo extends StatelessWidget {

  final int initIndex;
  final List<CachedNetworkImage> imgList;
  FullscreenSliderDemo({@required this.initIndex, @required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(elevation: 0, backgroundColor: Colors.grey[600]),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              initialPage: initIndex,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
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