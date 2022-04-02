import 'package:flutter/material.dart';
// import 'package:myFirst/Pages/user/widget/widget.dart';
class HelpFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        title: Center(
          child: Text("Help & Feedback"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true, //just set this property
          children: [
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
            _options(title: "Help", intr: "I can help you someting"),
          ],
        ),
      ),
    );
  }

  Widget _options({String title, String intr}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
          // leading: Icon(),
          title: Text(title, style: TextStyle(fontSize: 20, color: Colors.black),),
          subtitle: Text(intr),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
          onTap: () {
            print(title);
            // searchNotifier.keyword = notifier.searchHistory[index]["key"];
            // searchNotifier.notifyListeners();
            // print("keyword : ${searchNotifier.keyword}");
            // Navigator.of(context).pop();
          },
        ),
  );
}
