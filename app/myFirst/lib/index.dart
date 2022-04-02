// //----package----
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// // ----Page----
// // import 'Pages/home.dart';
// // import 'Pages/favorite.dart';
// import 'Pages/search.dart';
// // import 'Pages/signIn.dart';
// import 'package:myFirst/Model/myModel.dart';
// // import 'Pages/user.dart';
// import 'Pages/SearchWidget/tmpBox.dart';

// import 'package:myFirst/Pages/user/pages/help_feedback.dart';

// import 'test.dart';
// class Index extends StatelessWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
//   // GlobalKey _bottomNavigationKey = GlobalKey();

//   final List<Widget> pages = [
//     // Home(),
//     TmpBox(),
//     // Help_FeedBack(),
//     OpenContainerTransformDemo(),
//     SearchPage(),
//     // FavoritePage(),
//     // Profile(),
//     // User(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     print('build IndexPage');
//     // booksData = booksData.isNotEmpty ? booksData : ModalRoute.of(context).settings.arguments; // 接收Loading傳來得資料

//     return Consumer<MyModel>(
//       builder: (_, localNotifier, __) => Scaffold(
//           // appBar: AppBar(),
//           body: SafeArea(child: pages[localNotifier.page]), // 頁面切換

//           bottomNavigationBar: ConvexAppBar(
//             items: [
//               TabItem(title: "test", icon: Icons.pan_tool),

//               // TabItem(title: "Home", icon: Icons.home),
//               TabItem(title: "animatino", icon: Icons.android),
//               TabItem(title: "Search", icon: Icons.search),
//               // TabItem(title: "user", icon: Icons.supervised_user_circle),
//             ],
//             initialActiveIndex: 0, // optional, default as 0
//             // style: TabStyle.textIn,
//             onTap: (index) => localNotifier.barPage(index),
//             // curveSize: 70,
//             backgroundColor: Colors.white,
//             color: Colors.black,
//             activeColor: Colors.black,
//           )

//           // CurvedNavigationBar(
//           //   // key: _bottomNavigationKey,
//           //   index: 0,
//           //   height: 50.0,
//           //   items: <Widget>[
//           //     // Icon(Icons.home, size: 30),
//           //     Icon(Icons.search, size: 30),
//           //     Icon(Icons.favorite, size: 30),
//           //     // Icon(Icons.supervised_user_circle, size: 30),
//           //     // Icon(Icons., size: 30),
//           //   ],
//           //   color: Colors.white,
//           //   buttonBackgroundColor: Colors.white,
//           //   backgroundColor: Colors.grey[200],
//           //   animationCurve: Curves.easeInOut,
//           //   animationDuration: Duration(milliseconds: 300),
//           //   onTap: (index) {
//           //     print('index: $index');
//           //     homeModel.barPage(index);
//           //   },
//           // ),
//           ),
//     );

//     // DefaultTabController(
//     //   length: pages.length,
//     //   initialIndex: 0,
//     //   child: Scaffold(
//     //     body: TabBarView(
//     //       children: pages,
//     //     ),
//     //     // body: ChangeNotifierProvider(
//     //     // create: (_)=> MyChangeNotifier(),
//     //     // child: TabBarView(children: pages,),
//     //     // ),

//     //     bottomNavigationBar: Container(
//     //       color: Colors.white,
//     //       padding: EdgeInsets.only(bottom: 5.0),
//     //       child: new TabBar(
//     //         tabs: [
//     //           Tab(icon: Icon(Icons.home)),
//     //           // Tab(icon: Icon(Icons.search)),
//     //           // Tab(icon: Icon(Icons.account_circle)),
//     //         ],

//     //         unselectedLabelColor: Colors.black,
//     //         labelColor: Colors.blue[700],
//     //         indicatorColor: Colors.white,
//     //         // indicatorColor: null,
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
