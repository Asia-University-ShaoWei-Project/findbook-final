import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'loading.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/Model/myModel.dart';
// import 'Pages/test.dart';

// import 'package:myFirst/Pages/future/sliding_sheet.dart';
import 'package:myFirst/Pages/searchWidget/endDrawer.dart';
import 'package:myFirst/Pages/searchWidget/searchBox2.dart';

// ---- index ----
import 'Pages/home.dart';
import 'Pages/search.dart';
// import 'Pages/signIn.dart';
import 'Pages/user.dart';
// import 'test.dart';
// import 'Pages/SearchWidget/tmpBox.dart';

import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

void main() => runApp(
      EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
          Locale('zh', 'TW')
        ],
        path: 'assets/lang', // <-- change patch to your
        fallbackLocale: Locale('zh', 'CN'),
        child: ChangeNotifierProvider(
          create: (_) => MyModel(),
          child: MaterialApp(
            // debugShowCheckedModeBanner: false,
            title: 'Find Book',
            theme: ThemeData(
              // fontFamily: 'Montserrat',
              scaffoldBackgroundColor: Colors.white,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => Loading(),
              '/index': (context) => Index(),
              '/search/box': (context) => SearchBox2(),
              '/search/box/drawer': (context) => SearchEndDrawer(),
              // '/user': (context) => User(),
            },
          ),
        ),
      ),
    );

class Index extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
  final controller = ScrollController();
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("首頁"), // 首頁
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text("搜尋"), // 搜尋
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text("使用者"), // 使用者
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print('build IndexPage');
    controller.bottomNavigationBar.height = 65;

    // booksData = booksData.isNotEmpty ? booksData : ModalRoute.of(context).settings.arguments; // 接收Loading傳來得資料
    final List pages = [
      Home(controller: controller),
      // TmpBox(),
      SearchPage(controller: controller),
      // User(controller: controller),
      User(controller: controller),
      // Test(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          // ignore: missing_return
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: Consumer<MyModel>(
            builder: (_, localNotify, __) => Snap(
              controller: controller.bottomNavigationBar,
              child: ValueListenableBuilder<int>(
                  valueListenable: controller.bottomNavigationBar.tabNotifier,
                  builder: (context, value, child) => pages[value]), // 頁面切換
            ),
          ),
        ),
      ),
      // ),
      bottomNavigationBar: ScrollBottomNavigationBar(
          selectedIconTheme: IconThemeData(size: 30),
          fixedColor: Colors.black, //選擇頁顏色
          backgroundColor: Colors.white,
          controller: controller,
          items: items),

      // BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首頁')),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('搜尋')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle), title: Text('用戶')),
      //     // BottomNavigationBarItem(
      //         // icon: Icon(Icons.settings), title: Text('測試')),
      //   ],

      //   elevation: 10,
      //   iconSize: 26,
      //   currentIndex: notifier.page, //目前選擇頁索引值
      //   fixedColor: Colors.black, //選擇頁顏色
      //   onTap: (index) =>notifier.barPage(index), //BottomNavigationBar 按下處理事件
      // ),
    );
  }
}
