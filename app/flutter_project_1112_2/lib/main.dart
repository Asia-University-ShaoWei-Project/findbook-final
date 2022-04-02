// --- package ---
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';
// --- Model ---
import 'package:myFirst/models/persion_model.dart';
import 'package:myFirst/models/search_model.dart';
import 'package:myFirst/models/user_model.dart';

// import 'Pages/test.dart';
// import 'package:myFirst/Pages/future/sliding_sheet.dart';
import 'package:myFirst/screens/search/endDrawer.dart';
import 'package:myFirst/screens/search/items/searchField.dart';

import 'utils/theme.dart';

// ---- srceen ----
import 'screens/home.dart';
import 'screens/search.dart';
// import 'Pages/signIn.dart';
import 'screens/user.dart';
// import 'test.dart';
// import 'Pages/SearchWidget/tmpBox.dart';
import 'package:myFirst/screens/search/items/searchField.dart';
import 'package:myFirst/screens/search/product/product.dart';

import 'package:myFirst/screens/search/indexLoaing.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'dart:async';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(
      EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
          Locale('zh', 'TW')
        ],
        path: 'assets/lang', // <-- change patch to your
        fallbackLocale: Locale('zh', 'CN'),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SelfModel()),
            ChangeNotifierProvider(create: (_) => SearchModel()),
            ChangeNotifierProvider(create: (_) => UserModel()),
          ],
          child: Selector<SelfModel, bool>(
            selector: (_, viewModel) => viewModel.switchTheme,
            builder: (buildContext, switchTheme, widget) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Find Book',
              theme: basicTheme(switchTheme),
              initialRoute: '/',
              routes: {
                '/': (context) => Loading(),
                '/home': (context) => HomeMain(),
                '/home/search/search_field': (context) => SearchField(),
                '/home/search/search_field/items': (context) => SearchMain(),
                '/home/search/box/drawer': (context) => SearchEndDrawer(),
              },
            ),
          ),
        ),
      ),
    );

class Loading extends StatelessWidget {
  // void books() async{
  //   HomeBooksService instance = HomeBooksService();
  //   await instance.getData();
  //   print(instance.data);
  //   Navigator.pushReplacementNamed(context, '/home', arguments: {
  //     'data': instance,
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final notifier = Provider.of<SelfModel>(context, listen: false);

    Future init() async {
      // 等待此函式才能繼續
      try {
        await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
        if (useWhiteForeground(Colors.white)) {
          FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
        } else {
          FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        }
        await notifier.getProfile();
        // final storage = new FlutterSecureStorage();

        // Read value
        // String value = await storage.read(key: "myToken");
        // print("value : $value");

        // Read all values
        // Map<String, String> allValues = await storage.readAll();

        // Delete value
        // await storage.delete(key: key);

        // Delete all
        // await storage.deleteAll();

        // Write value
        // await storage.write(key: "myToken", value: "fsd15f35151value");
        // value = await storage.read(key: "myToken");
        // print("value : $value");

      } catch (e) {
        print('!!!!!!!!!!!LOADING ERROR!!!!!!!!!!!');
        print(e);
      }
      await Future.delayed(Duration(seconds: 2), () => print("delay..."));
      Navigator.pushReplacementNamed(context, '/home');
    }
    // print('1');
    // Future init2() async {
    // print('2');

    //   await Future.delayed(Duration(seconds: 1), () => print("delay..."));
    // print('3');

    // }
    // print('4');

    // init2();
    // print('5');

    // init();

    // Navigator.push(context, MaterialPageRoute(builder: (context) => Index()));
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 20,
              child: Image.asset(
                "assets/images/loading/reading2.png",
                width: size.width * 0.2,
              ),
            ),
            Positioned(
              bottom: 0,
              left: -60,
              child: Image.asset(
                "assets/images/loading/reading.png",
                width: size.width * 0.7,
              ),
            ),
            // Image.asset("assets/images/logo.png", width: size.width * 0.6,),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    width: size.width * 0.6,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  // SpinKitWave(
                  //   color: Color.fromRGBO(32, 77, 118, 0.8),
                  //   size: 20.0,
                  // ),
                  FutureBuilder(future: init(), builder: (context, snapshot) => SizedBox(),)
                ]),
          ],
        ),
      ),
    );  
  }
}
