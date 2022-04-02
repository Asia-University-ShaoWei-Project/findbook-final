import 'package:flutter/material.dart';

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
        title: Center(
          child: Text("Settings"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true, //just set this property
          children: [
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: false),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
            _options(title: "Help", trailing: true),
          ],
        ),
      ),
    );
  }

  Widget _options(
      {String title = "", bool trailing} ) {
        
    return ListTile(
      title: Text(title),
      // subtitle: Text("20${notifier.searchHistory[index]["date"]}"),
      trailing: trailing
          ? Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          : Switch(value: check, onChanged: (value) { setState((){
            check = !check;
          }); }),
      onTap: () {
        // Navigator.push(context, route)
        print(title);
        // searchNotifier.keyword = notifier.searchHistory[index]["key"];
        // searchNotifier.notifyListeners();
        // print("keyword : ${searchNotifier.keyword}");
        // Navigator.of(context).pop();
      },
    );
  }


}
