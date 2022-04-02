import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
// import '../testClass.dart';
// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
import 'package:carousel_slider/carousel_slider.dart';
import 'package:like_button/like_button.dart';

import 'package:myFirst/models/homeModel.dart';
import 'package:myFirst/models/persion_model.dart';
import 'package:provider/provider.dart';

class HomeMain extends StatelessWidget {
  final HomeModel homeModel = HomeModel();
  final CarouselController buttonCarouselController = CarouselController();
  // final bottomBarController;
  // HomeMain({@required this.bottomBarController});
  List<List<List<String>>> tmpdata = [
    [
      [
        '鯨頭鸛之王（台灣版獨家簽繪印刷扉頁）',
        "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/087/38/0010873848.jpg&v=5f9b93f9&w=348&h=348"
      ],
      [
        '像火箭科學家一樣思考：9大策略，翻轉你的事業與人生',
        "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/087/39/0010873962.jpg&v=5f897647&w=348&h=348"
      ],
      [
        '多空轉折一手抓',
        "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/CN1/139/42/CN11394216.jpg&v=5f6b23c0&w=348&h=348"
      ],
    ],
    [
      [
        "你是我的榮耀",
        "https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/CN1/164/14/CN11641483.jpg&v=5cde2abb&w=348&h=348"
      ],
      [
        "為人三會：會說話會辦事會做人",
        "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/CN1/171/44/CN11714432.jpg&v=5ea2b1b2&w=348&h=348"
      ],
      [
        "墨菲定律（精裝紀念版）",
        "https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/CN1/164/68/CN11646896.jpg&v=5d6cef44&w=348&h=348"
      ],
    ]
  ];

  @override
  Widget build(BuildContext context) {
    print('build HomePage');

    // booksData = booksData.isNotEmpty ? booksData : ModalRoute.of(context).settings.arguments; // 接收Loading傳來得資料
    return ChangeNotifierProvider(
      create: (_) => homeModel,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text('Name'), accountEmail: Text('Email')),
              ListTile(
                title: Text('aaa'),
              ),
              ListTile(
                title: Text('bbb'),
              ),
            ],
          ),
        ),

        // backgroundColor: Colors.indigoAccent,
        // backgroundColor: null,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: Text(
            'Find Book',
            style: TextStyle(
                color: Colors.black, fontSize: 18.0, letterSpacing: 2.5),
          ),
          leading: IconButton(
            // iconSize: 30.0,
            icon: Icon(Icons.notifications_outlined),
            // color: Colors.black,
            // icon: const CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/user.png'),
            //   radius: 14.0,
            // ),
            // tooltip: '個人資訊',
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              // color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              // color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )
          ],
        ),
        body: ListView(
          // controller: bottomBarController,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  // Positioned(bottom: -20, right: -10, child: Image.asset('assets/images/home/book1.png')),
                  Positioned(
                      top: 5,
                      left: 25,
                      child: Image.asset('assets/images/home/book2.png')),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.color,
                        boxShadow: [
                          BoxShadow(
                              // color: Colors.grey[400].withOpacity(0.5),
                              // offset: Offset(1, 1), //X, Y
                              // blurRadius: 2,
                              // spreadRadius: 2,
                              ),
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).pushNamed("/search/box"),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.search,
                              color: Color(0xFFbdbdbd),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "searhc here",
                                maxLines: 1,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            // Container(
            //   // color: Colors.white,
            //   padding: EdgeInsets.symmetric(vertical: 40),
            //   // height: 150,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     // crossAxisAlignment: CrossAxisAlignment.center,
            //     // crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       GestureDetector(
            //         onTap: () => print('collect'),
            //         child: Column(
            //           children: [
            //             Icon(Icons.menu_book),
            //             Padding(
            //               padding: EdgeInsets.only(top: 5),
            //               child: Text("My Collect"),
            //             )
            //           ],
            //         ),
            //       ),
            //       Container(height: 50, child: VerticalDivider(width: 5)),
            //       GestureDetector(
            //         onTap: () => print('other'),
            //         child: Column(
            //           children: [
            //             Icon(Icons.cached),
            //             Padding(
            //               padding: EdgeInsets.only(top: 5),
            //               child: Text("My Other"),
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            _itemCard(context, title: "暢銷排行", icon: Icons.emoji_events, tmp: 0),
            _itemCard(context, title: "熱門推薦", icon: Icons.face, tmp: 1),
            _itemCard(context, title: "最近查看", icon: Icons.menu_book, tmp: 1),
            SizedBox(height: 20)

            // Container(
            //     child: CarouselSlider(
            //         options: CarouselOptions(
            //           // aspectRatio: 3,
            //           viewportFraction: 0.8,
            //           enlargeCenterPage: true,
            //           enableInfiniteScroll: false,
            //           // initialPage: 2,
            //           autoPlay: true,
            //         ),
            //         items: [
            //       ts(0),
            //       ts(1),
            //       ts(2),
            //     ])),
            // Consumer<MyModel>(
            //     builder: (_, localNotifier, __) => Column(
            //           children: [
            //             Text("localNotifier.token"),
            //             Text(localNotifier.token != null
            //                 ? "token is ${localNotifier.token}"
            //                 : "token is null"),
            //             Text("localNotifier.token"),
            //           ],
            //         ))
          ],
        ),
        // ListView(
        //   children: <Widget>[
        //     Text(
        //       'HOME',
        //       style: TextStyle(fontSize: 30.0),

        //     ),
        //     CircularProgressIndicator(  // 讀取
        //       valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[300]),
        //       backgroundColor: Colors.grey,
        //       strokeWidth: 2, // 粗細
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget _itemCard(context, {String title, IconData icon, int tmp}) => Card(
        margin: EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.zero,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                  // TextButton(onPressed: (){}, child: Text('test'),),\
                  OutlineButton(
                    onPressed: () {
                      print('Received click');
                    },
                    child: OpenContainer(
                        closedBuilder: (ctx, action) => Text(
                              '更多',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                        openBuilder: (ctx, action) =>
                            Scaffold(body: Text('hi'))),
                  ),

                  OutlineButton(
                    onPressed: () {
                      print('Received click');
                    },
                    child: Text(
                      '更多',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 5,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 150,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          tmpdata[tmp][index][1],
                          height: 100,
                        ),
                        // Image.asset(

                        //   'assets/book.jfif',
                        //   // "https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/98/0010869853.jpg&v=5f4f7453&w=348&h=348",
                        //   height: 100,
                        // ),
                        Text(
                          tmpdata[tmp][index][0],
                          // "BookName$index",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline2,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
        // borderOnForeground: ,
      );
}

// Widget ts(int value) {
//   // final List<String> urls = [
//   //   "https://im1.book.com.tw/image/getImage?i=https://addons.books.com.tw/G/ADbanner/2020/08/memberday_590400.gif&v=5f2bbe85&w=590&h=400",
//   //   "https://im1.book.com.tw/image/getImage?i=https://addons.books.com.tw/G/ADbanner/2020/08/Nachgefragt0807_590.jpg&v=5f2a7f3d&w=590&h=400",
//   //   "https://im1.book.com.tw/image/getImage?i=https://addons.books.com.tw/G/ADbanner/lifestyle/M/2020/08/08073c_590.jpg&v=5f2947fc&w=590&h=400"
//   // ];
//   return Container(
//     margin: EdgeInsets.all(5.0),
//     child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(5.0)),
//         child: Stack(
//           children: <Widget>[
//             // Image.network(urls[value], fit: BoxFit.fitHeight, width: 500.0),
//             // Image.network(urls[value], fit: BoxFit.fitHeight, width: 500.0),
//             Image.asset("assets/images/advertising.png"),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(200, 0, 0, 0),
//                       Color.fromARGB(0, 0, 0, 0)
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   'No. $value image',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )),
//   );
// }
