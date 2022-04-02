// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'loading.dart';
// import 'package:provider/provider.dart';
// import 'package:myFirst/Model/myModel.dart';
// // import 'Pages/test.dart';

// // import 'package:myFirst/Pages/future/sliding_sheet.dart';
// import 'package:myFirst/Pages/searchWidget/endDrawer.dart';
// import 'package:myFirst/Pages/searchWidget/searchBox2.dart';

// // ---- index ----
// import 'Pages/home.dart';
// import 'Pages/search.dart';
// // import 'Pages/signIn.dart';
// import 'Pages/user.dart';
// // import 'test.dart';
// // import 'Pages/SearchWidget/tmpBox.dart';

// import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';
// import 'dart:math';

// final MyModel myModel = MyModel();
// void main() => runApp(
//       EasyLocalization(
//         supportedLocales: [
//           Locale('en', 'US'),
//           Locale('zh', 'CN'),
//           Locale('zh', 'TW')
//         ],
//         path: 'assets/lang', // <-- change patch to your
//         fallbackLocale: Locale('zh', 'CN'),
//         child: ChangeNotifierProvider(
//           create: (_) => myModel,
//           child: MaterialApp(
//             // debugShowCheckedModeBanner: false,
//             title: 'Find Book',
//             theme: ThemeData(
//               fontFamily: 'Montserrat',
//               scaffoldBackgroundColor: Colors.white,
//             ),
//             initialRoute: '/',
//             routes: {
//               '/': (context) => Loading(),
//               '/index': (context) => Index(),
//               '/search/box': (context) => SearchBox2(),
//               '/search/box/drawer': (context) => SearchEndDrawer(),
//               // '/user': (context) => User(),
//             },
//           ),
//         ),
//       ),
//     );

// class Index extends StatelessWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
//   final controller = ScrollController();

//   final List<Widget> pages = [
//     Home(),
//     // TmpBox(),
//     SearchPage(),
//     // User(controller: controller),
//     User(),
//     // Test(),
//   ];
//   final items = <BottomNavigationBarItem>[
//     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首頁')),
//     BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('搜尋')),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.account_circle), title: Text('用戶')),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     print('build IndexPage');
//     // booksData = booksData.isNotEmpty ? booksData : ModalRoute.of(context).settings.arguments; // 接收Loading傳來得資料

//     return Consumer<MyModel>(
//       builder: (_, localNotify, __) => Scaffold(
//         // appBar: AppBar(),
//         // body: SafeArea(child: pages[notifier.page]), // 頁面切換
//         body: SafeArea(
//           child: Snap(
//             controller: controller.bottomNavigationBar,
//             child: ValueListenableBuilder<int>(
//               valueListenable: controller.bottomNavigationBar.tabNotifier,
//               builder: (context, value, child) => ListView.builder(
//                 controller: controller,
//                 itemBuilder: _listBuildItem,
//               ),
//             ), // 頁面切換
//           ),
//         ),
//         bottomNavigationBar:
//             ScrollBottomNavigationBar(controller: controller, items: items),

//         // BottomNavigationBar(
//         //   items: <BottomNavigationBarItem>[
//         //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首頁')),
//         //     BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('搜尋')),
//         //     BottomNavigationBarItem(
//         //         icon: Icon(Icons.account_circle), title: Text('用戶')),
//         //     // BottomNavigationBarItem(
//         //         // icon: Icon(Icons.settings), title: Text('測試')),
//         //   ],

//         //   elevation: 10,
//         //   iconSize: 26,
//         //   currentIndex: notifier.page, //目前選擇頁索引值
//         //   fixedColor: Colors.black, //選擇頁顏色
//         //   onTap: (index) =>notifier.barPage(index), //BottomNavigationBar 按下處理事件
//         // ),
//       ),
//     );
//   }

//   Widget _listBuildItem(BuildContext context, int index) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 50),
//       color: Color(Random().nextInt(0xffffffff)),
//       child: Center(child: Text("$index")),
//     );
//   }
// }
