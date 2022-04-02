import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/models/persion_model.dart';

// import 'package:myFirst/Pages/user/widget/widget.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        title: Text("Settings", style: Theme.of(context).textTheme.headline1),
      ),
      body: ListView(
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true, //just set this property
        children: [
          _options(title: "Help"),
          _options(title: "Help"),
          Consumer<SelfModel>(builder: (_, localNotify, __) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text('夜黑模式', style: Theme.of(context).textTheme.headline1,),
                  // subtitle: Text("20${notifier.searchHistory[index]["date"]}"),
                  trailing: Switch(
                      value: localNotify.switchTheme,
                      onChanged: (value) => localNotify.switchThemeFunc()),
                  onTap: () => localNotify.switchThemeFunc()
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _options({String title = "", String routeName}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(title, style: Theme.of(context).textTheme.headline1),
          // subtitle: Text("20${notifier.searchHistory[index]["date"]}"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),

          onTap: () {
            // Navigator.push(context, route)
            print(title);
            // searchNotifier.keyword = notifier.searchHistory[index]["key"];
            // searchNotifier.notifyListeners();
          },
        ),
      ),
    );
  }
}
