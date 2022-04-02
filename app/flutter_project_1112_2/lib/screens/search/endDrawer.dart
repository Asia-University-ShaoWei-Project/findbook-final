// import 'data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myFirst/models/search_model.dart';
// import 'package:myFirst/Model/myModel.dart';

// ignore: must_be_immutable
class SearchEndDrawer extends StatelessWidget {
  var optionData;
  var optionIcon;
  var sele;
  final myNotifier;
  SearchEndDrawer({this.myNotifier});

  @override
  Widget build(BuildContext context) {
    final searchNotifier = myNotifier ?? Provider.of<SearchModel>(context);
    // searchNotifier = Provider.of<SearchModel>(context);
    optionData = searchNotifier.optionData;
    optionIcon = searchNotifier.optionIcon;
    sele = searchNotifier.sele;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          // color: Colors.white,
                          // splashRadius: 20,
                          // splashColor: Colors.grey,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.clear),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Center(
                          child: Text(
                            'CATEGORY',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.black,
                      // child:

                      // ),
                    ]),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView(
                children: [
                  // SizedBox(height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 

                    List.generate(
                        3,
                        (index) => optionCard(
                            index,
                            searchNotifier.title[index],
                            searchNotifier.fromOptions)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionCard(int itemIndex, String title, dynamic optionFunc) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1.0, color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Wrap(
              direction: Axis.horizontal,
              spacing: 15.0,
              runSpacing: 4.0,
              children: List.generate(
                  // options
                  optionData[itemIndex].length,
                  (index) => RaisedButton.icon(
                        onPressed: () => optionFunc(itemIndex, index),
                        color: sele[itemIndex] == index
                            ? Colors.grey[300]
                            : Colors.white,
                        icon: optionIcon[optionData[itemIndex][index]],
                        label: Text(
                          optionData[itemIndex][index],
                          style: TextStyle(fontSize: 14.0),
                        ),
                      )))
        ],
      ),
    );
  }
}
