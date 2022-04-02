import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        title: Text("個人資訊", style: Theme.of(context).textTheme.headline1,),
      ),
      body: Center(child: Text("Empty", style: Theme.of(context).textTheme.headline2)),
    );
  }
}
