import 'package:flutter/material.dart';
// import '../testClass.dart';
// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
import 'package:carousel_slider/carousel_slider.dart';

import 'package:myFirst/Model/homeModel.dart';
import 'package:myFirst/Model/myModel.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final HomeModel homeModel = HomeModel();
  final CarouselController buttonCarouselController = CarouselController();
  final controller;
  Home({@required this.controller});

  @override
  Widget build(BuildContext context) {
    print('build HomePage');

    // booksData = booksData.isNotEmpty ? booksData : ModalRoute.of(context).settings.arguments; // 接收Loading傳來得資料
    return ChangeNotifierProvider(
      create: (_) => homeModel,
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        floatingActionButton: FlatButton(
            onPressed: () {
              print("aa");
            }, //点击时我们期望输出点击次数
            child: Icon(Icons.add)),

        // backgroundColor: Colors.indigoAccent,
        // backgroundColor: null,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Find Book',
            style: TextStyle(
                color: Colors.black, fontSize: 22.0, letterSpacing: 2.5),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.black,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.notifications),
              color: Colors.black,
              // icon: const CircleAvatar(
              //   backgroundImage: AssetImage('assets/images/user.png'),
              //   radius: 14.0,
              // ),
              // tooltip: '個人資訊',
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ],
        ),
        body: ListView(
          controller: controller,
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(vertical: 50),
              // height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => print('collect'),
                    child: Column(
                      children: [
                        Icon(Icons.account_balance),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text("My Collect"),
                        )
                      ],
                    ),
                  ),
                  Container(height: 50 ,child: VerticalDivider(width: 5)),
                  GestureDetector(
                    onTap: () => print('other'),
                    child: Column(
                      children: [
                        Icon(Icons.cached),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text("My Other"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            _homeCard(title: "暢銷排行", icon: Icons.face),
            _homeCard(title: "熱門推薦", icon: Icons.face),
            _homeCard(title: "最近閱覽", icon: Icons.face),
            SizedBox(height: 100)

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
}

Widget _homeCard({String title, IconData icon}) => Card(
  elevation: 0,
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 150,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        "https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/086/98/0010869853.jpg&v=5f4f7453&w=348&h=348",
                        height: 100,
                      ),
                      Text(
                        "BookName$index",
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
      // borderOnForeground: ,
    );

Widget ts(int value) {
  // final List<String> urls = [
  //   "https://im1.book.com.tw/image/getImage?i=https://addons.books.com.tw/G/ADbanner/2020/08/memberday_590400.gif&v=5f2bbe85&w=590&h=400",
  //   "https://im1.book.com.tw/image/getImage?i=https://addons.books.com.tw/G/ADbanner/2020/08/Nachgefragt0807_590.jpg&v=5f2a7f3d&w=590&h=400",
  //   "https://im1.book.com.tw/image/getImage?i=https://addons.books.com.tw/G/ADbanner/lifestyle/M/2020/08/08073c_590.jpg&v=5f2947fc&w=590&h=400"
  // ];
  return Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            // Image.network(urls[value], fit: BoxFit.fitHeight, width: 500.0),
            // Image.network(urls[value], fit: BoxFit.fitHeight, width: 500.0),
            Image.asset("assets/images/advertising.png"),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. $value image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  );
}
