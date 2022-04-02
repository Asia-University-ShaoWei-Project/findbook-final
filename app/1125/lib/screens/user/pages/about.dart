import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        title: Text("關於", style: Theme.of(context).textTheme.headline1,),
      ),
      body: Center(child: Card(
        margin: EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Text("開發人員 : ShaoWei Gao", style: Theme.of(context).textTheme.headline2,),
        ),
      )),
    );
  }
}