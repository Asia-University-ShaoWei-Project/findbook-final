import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:myFirst/Model/searchAPI.dart';
// import 'package:provider/provider.dart';
import 'data.dart';

class SearchFromMethod extends StatefulWidget {
  @override
  _SearchFromMethodState createState() => _SearchFromMethodState();
}

class _SearchFromMethodState extends State<SearchFromMethod> {
  
  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size;
    // searchNotifier = Provider.of<SearchModel>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Stack(
          children: [
            ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) =>
                    itemCard(index, title[index]) // 索引, 標題文字
                ),
            Positioned(
              bottom: 0,
              child: Container(
                width: mywidth.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    bottomButton("CANCEL", Icons.exit_to_app, Colors.grey[200], Colors.black, () => Navigator.pop(context)),
                    bottomButton("CHECK", Icons.check, Colors.black, Colors.white, () => print('check')),


                    // RaisedButton.icon(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.ac_unit),
                    //   label: Text('APPLY'),
                    // ),
                    // RaisedButton.icon(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.ac_unit),
                    //   label: Text('CANCEL'),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemCard(int itemIndex, String title) {
    // print("Card : count -> $itemIndex, title -> $title ");

    return Card(
      margin: EdgeInsets.only(bottom: 25.0),
      color: Colors.white,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: itemContainer(itemIndex, title), // 內容
    );
  }

  Widget itemContainer(int itemIndex, String title) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: -50,
          top: -100,
          child: Image.asset(
            "assets/images/other/ddd$itemIndex.png",
            width: 200,
          ),
        ),
        Positioned(
          right: -20,
          top: -20,
          child: Image.asset(
            "assets/images/other/ddd$itemIndex.png",
            width: 50,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          // margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text(title,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[700],
                  )),
              Divider(
                color: Colors.grey[400],
                height: 40,
                thickness: 0.5,
              ),
              Container(
                child: Wrap(
                  direction: Axis.horizontal,
                  // direction: Axis.vertical,
                  spacing: 5.0,
                  runSpacing: 4.0,
                  children: List.generate(
                      optionData[itemIndex].length,
                      (index) => options(
                          itemIndex, index, optionData[itemIndex][index])),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget options(int itemIndex, int optionIndex, String text) {
    return RaisedButton.icon(
      onPressed: () {
        setState(() {
          sele[itemIndex] = optionIndex;
        });
        print("index : $itemIndex ->${sele[itemIndex]}");
      },
      color: sele[itemIndex] == optionIndex ? Colors.grey[350] : Colors.white,
      splashColor: optionsColors[itemIndex],
      icon:CircleAvatar(
        backgroundImage: AssetImage("assets/images/bookStore/books.png"),
        radius: 15,
      ),
          // SvgPicture.asset("assets/images/svg/svg/all.svg", height: 25,),
          // SvgPicture.asset(
          //   "assets/images/svg/svg/store/sanmin.svg",
          //   height: 25,),
      // CircleAvatar(
      //   backgroundImage: SvgPicture.asset("assets/images/  svg/svg/all.svg", height: 50,),
      //   radius: 15,
      // ),
      // Image.asset("assets/images/books.png", width: 35,),
      label: Text(
        text,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }

  Widget bottomButton(String title, icon,Color color, Color textColor, Function func) {
    return RaisedButton.icon(
      onPressed: func,
      padding: EdgeInsets.all(13),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      clipBehavior: Clip.antiAlias,
      icon: Icon(icon, color: textColor,),
      color: color.withOpacity(0.9),
      textColor: textColor,
      label: Text(title, style: TextStyle(fontSize: 16.0),),
    );
  }
}

