import 'package:flutter/material.dart';

class TmpBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Index()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    // offset: Offset(0.5, 0.5), //X, Y
                    blurRadius: 0.2,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      print('ddd');
                    },
                    icon: Icon(Icons.dehaze),
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: Icon(Icons.mic),
                  ),
                ],
              ),
            ))
            );
  }
}
