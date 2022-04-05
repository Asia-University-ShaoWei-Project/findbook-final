// --- package ---
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';
// --- Model ---
import 'package:myFirst/models/persion_model.dart';
import 'package:myFirst/models/search_model.dart';
import 'package:myFirst/models/user_model.dart';

import 'package:myFirst/screens/search/endDrawer.dart';
import 'package:myFirst/screens/search/items/searchField.dart';

import 'utils/theme.dart';

// ---- srceen ----
import 'screens/home.dart';
import 'screens/rm_page/search.dart';
import 'screens/user/user.dart';
import 'package:myFirst/screens/search/items/searchField.dart';
import 'package:myFirst/screens/search/product/product.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import './screens/user/pages/messenger.dart';
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
                '/home/user': (context) => UserMain(),
                '/home/user/messenger': (context) => Messenger(),
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final notifier = Provider.of<SelfModel>(context, listen: false);

    Future init() async {
      try {
        await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
        if (useWhiteForeground(Colors.white)) {
          FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
        } else {
          FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        }
        await notifier.getProfile();
      } catch (e) {
        print(e);
      }
      await Future.delayed(Duration(seconds: 2), () => print("delay..."));
      Navigator.pushReplacementNamed(context, '/home');
    }

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
                  FutureBuilder(future: init(), builder: (context, snapshot) => SizedBox(),)
                ]),
          ],
        ),
      ),
    );  
  }
}
