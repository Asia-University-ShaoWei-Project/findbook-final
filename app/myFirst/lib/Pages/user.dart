import 'package:flutter/material.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:myFirst/Model/myModel.dart';
import 'package:provider/provider.dart';
// import 'dart:convert' show json;
// import 'user/login.dart';

import 'package:myFirst/Pages/user/pages/profile.dart';
import 'package:myFirst/Pages/user/pages/collect.dart';
import 'package:myFirst/Pages/user/pages/settings.dart';
import 'package:myFirst/Pages/user/pages/help_feedback.dart';
import 'package:myFirst/Pages/user/pages/about.dart';
import 'package:myFirst/Model/userModel.dart';
// ignore: must_be_immutable

class User extends StatelessWidget {
  // var myNotifier;
  final List _pages = [
    Profile(),
    Collect(),
    Settings(),
    HelpFeedback(),
    About()
  ];
  final UserModel userModel = UserModel();
  final controller;
  User({@required this.controller});
  @override
  Widget build(BuildContext context) {
    // final myNotifier = Provider.of<MyModel>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => userModel,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
            controller: controller,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 40, 0, 10),
                child: GestureDetector(
                    onTap: () {
                      print('profile');
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/user.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("UserName",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              Text("other",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.grey[400].withOpacity(0.5),
                                      offset: Offset(1, 1), //X, Y
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.edit,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              // Container(
              //   // color: Colors.teal,
              //   child: Text('other'),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    _userDivider(),
                    _options(
                      title: "Your Notify",
                      icons: Icons.notifications,
                      color: Colors.orange[700],
                      index: 0,
                      context: context,
                    ),
                    _options(
                      title: "Your Profile",
                      icons: Icons.account_circle,
                      color: Colors.blue[400],
                      index: 1,
                      context: context,
                    ),
                    _options(
                      title: "Your Collect",
                      color: Colors.yellow,
                      icons: Icons.star,
                      index: 2,
                      context: context,
                    ),
                    _userDivider(),
                    _options(
                      title: "Settings",
                      color: Colors.grey[600],
                      icons: Icons.settings,
                      index: 3,
                      context: context,
                    ),
                    _options(
                      title: "Help & Feedback",
                      color: Colors.grey,
                      icons: Icons.help_outline,
                      index: 4,
                      context: context,
                    ),
                    _options(
                      title: "About",
                      color: Colors.grey,
                      icons: Icons.info_outline,
                      index: 5,
                      context: context,
                    ),
                    _userDivider(),
                    _options(title: "-----Test------", icons: Icons.clear),
                    _options(title: "-----Test------", icons: Icons.clear),
                    _options(title: "-----Test------", icons: Icons.clear),
                  ],
                ),
              ),
            ],
          ),
        
      ),
    );
  }

  Widget _userDivider() => Divider(
        height: 10,
        color: Colors.grey,
      );

  Widget _options(
      {String title = "",
      Color color,
      IconData icons = Icons.error,
      int index,
      dynamic context}) {
    return ListTile(
      // contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
      leading: Icon(
        icons,
        color: color,
      ),
      title: Text(title),
      // subtitle: Text("20${notifier.searchHistory[index]["date"]}"),
      trailing: Icon(
        Icons.arrow_forward_ios,
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
