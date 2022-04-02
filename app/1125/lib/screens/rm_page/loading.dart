import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'dart:async';
import 'package:provider/provider.dart';
import 'package:myFirst/models/persion_model.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: must_be_immutable
class Loading extends StatelessWidget {
  
  // void books() async{
  //   HomeBooksService instance = HomeBooksService();
  //   await instance.getData();
  //   print(instance.data);
  //   Navigator.pushReplacementNamed(context, '/home', arguments: {
  //     'data': instance,
  //   });
  // }
  
  var notifier;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    notifier = Provider.of<SelfModel>(context, listen: false);

    Future init() async{
      // 等待此函式才能繼續
      try {
        // change the status bar color to material color [green-400]
        await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
        if (useWhiteForeground(Colors.white)) {
          FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
        } else {
          FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        }

        // change the navigation bar color to material color [orange-200]
        // await FlutterStatusbarcolor.setNavigationBarColor(Colors.orange[200]);
        // if (useWhiteForeground(Colors.orange[200]) {
        //   FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
        // } else {
        //   FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
        // }

        // get statusbar color and navigationbar color
        // Color statusbarColor = await FlutterStatusbarcolor.getStatusBarColor();
        // Color navigationbarColor = await FlutterStatusbarcolor.getNavigationBarColor();
        
        
        await notifier.getProfile();
        // final storage = new FlutterSecureStorage();

        // Read value 
        // String value = await storage.read(key: "myToken");
        // print("value : $value");

        // Read all values
        // Map<String, String> allValues = await storage.readAll();

        // Delete value 
        // await storage.delete(key: key);

        // Delete all 
        // await storage.deleteAll();

        // Write value 
        // await storage.write(key: "myToken", value: "fsd15f35151value");
        // value = await storage.read(key: "myToken");
        // print("value : $value");
        
      } catch (e) {
        print('!!!!!!!!!!!LOADING ERROR!!!!!!!!!!!');
        print(e);
      }
      await Future.delayed(Duration(seconds: 2),()=> print("delay..."));
      Navigator.pushReplacementNamed(context, '/index');
    }
    init();
    
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Index()));
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 20,
              child: Image.asset("assets/images/loading/reading2.png", width: size.width * 0.2,),
            ),
            Positioned(
              bottom: 0,
              left: -60,
              child: Image.asset("assets/images/loading/reading.png", width: size.width * 0.7,),
            ),
            // Image.asset("assets/images/logo.png", width: size.width * 0.6,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png', width: size.width*0.6,),
                
                SizedBox(height: 30.0,),
                SpinKitWave(
                  color: Color.fromRGBO(32, 77, 118, 0.8),
                  size: 20.0,
                ),
              ]),
          ],),
      ),);
  
  }
  
}
