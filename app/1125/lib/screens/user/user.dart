import 'package:flutter/material.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:myFirst/Model/myModel.dart';
import 'package:provider/provider.dart';
// import 'dart:convert' show json;
// import 'user/login.dart';

import 'package:myFirst/screens/user/pages/profile.dart';
import 'package:myFirst/screens/user/pages/collect.dart';
import 'package:myFirst/screens/user/pages/settings.dart';
import 'package:myFirst/screens/user/pages/help_feedback.dart';
import 'package:myFirst/screens/user/pages/about.dart';
// ignore: must_be_immutable
import 'package:myFirst/models/user_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myFirst/utils/showSnackBar.dart';
import './pages/messenger.dart';
class UserMain extends StatelessWidget {
  // var myNotifier;
  final List _pages = [
    Messenger(),
    Profile(),
    Collect(),
    Settings(),
    HelpFeedback(),
    About()
  ];
  final UserModel userModel = UserModel();
  UserMain();
  @override
  Widget build(BuildContext context) {
    // final myNotifier = Provider.of<MyModel>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => userModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text("使用者", style: Theme.of(context).textTheme.headline2),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  icon: Icon(Icons.share_outlined), onPressed: () {}),
            )
          ],
        ),
        body: ListView(
          children: [
            Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CircleAvatar(
                        radius: 40,
                        child: SvgPicture.asset(
                            'assets/images/user/user_picture.svg',
                            // color: Colors.red,
                            semanticsLabel: 'A red up arrow'),
                      ),
                    ),
                    Expanded(
                        flex: 7,
                        child: ListTile(
                          title: Text("UserName",
                              style: Theme.of(context).textTheme.headline1),
                          subtitle: Text("other",
                              style: Theme.of(context).textTheme.headline3),
                          trailing: ButtonTheme(
                            minWidth: 20.0,
                            height: 20.0,
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  tooltip: "編輯",
                                  icon: Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                )
                                // OutlineButton(
                                //   onPressed: () {
                                //     print('Received click');
                                //   },
                                //   child:
                                //       onPressed: () {}),
                                ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            // Container(
            //   // color: Colors.teal,
            //   child: Text('other'),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                children: [
                  _optionCard(
                    [
                      _options(
                        context,
                        title: "通知",
                        icons: Icons.notifications,
                        color: Colors.red[600],
                        index: 0,
                      ),
                      _options(
                        context,
                        title: "個人資料",
                        icons: Icons.assignment_ind,
                        color: Colors.lightBlue[700],
                        index: 1,
                      ),
                      _options(
                        context,
                        title: "收藏庫",
                        color: Colors.yellow[600],
                        icons: Icons.star,
                        index: 2,
                      ),
                    ],
                  ),
                  _optionCard(
                    [
                      _options(
                        context,
                        title: "設定",
                        color: Colors.grey[850],
                        icons: Icons.settings,
                        index: 3,
                      ),
                      _options(
                        context,
                        title: "Help & Feedback",
                        color: Colors.grey[400],
                        icons: Icons.help_outline,
                        index: 4,
                      ),
                    ],
                  ),
                  _optionCard(
                    [
                      _options(
                        context,
                        title: "About",
                        color: Colors.grey[400],
                        icons: Icons.info_outline,
                        index: 5,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionCard(List<Widget> options) => Card(
      elevation: 2,
      // color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: options),
      ));

  Widget _options(
    context, {
    String title = "",
    Color color,
    IconData icons = Icons.error,
    int index,
  }) {
    return ListTile(
      // contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
      leading: Icon(
        icons,
        color: color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
        maxLines: 1,
      ),
      // subtitle: Text("20${notifier.searchHistory[index]["date"]}"),
      trailing: Icon(
        Icons.arrow_right,
        size: 18,
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => _pages[index]));
        print(title);
        // searchNotifier.keyword = notifier.searchHistory[index]["key"];
        // searchNotifier.notifyListeners();
      },
    );
  }
}
