import 'package:flutter_svg/flutter_svg.dart';
// import 'package:myFirst/Model/myModel.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class LogIn extends StatelessWidget {
  final myNotify;
  LogIn({this.myNotify});

  @override
  Widget build(BuildContext context) {
    // myNotify = Provider.of<MyModel>(context, listen: false);
    return Container(
      child: Column(
        children: [
          Text("你尚未登入"),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: (){
                  myNotify.test=true;
                },
              ), 
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white,
                child: SvgPicture.asset("assets/images/SVG/login/google.svg", width: 30,),

                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                // fillColor: Color(0x4267B2),
                fillColor: Colors.white,
                child: SvgPicture.asset("assets/images/SVG/login/facebook.svg", width: 30,),

                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
