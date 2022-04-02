import 'package:flutter/material.dart';
void showSnack2(context) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                color: Theme.of(context).appBarTheme.color,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("尚未開發完成..."),
              ),
            ],
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
    }

  // import 'package:myFirst/utils/showSnackBar.dart';