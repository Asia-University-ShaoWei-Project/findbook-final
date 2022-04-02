import 'package:flutter/material.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:cookie_jar/cookie_jar.dart';
import 'package:myFirst/models/persion_model.dart';
import 'package:provider/provider.dart';
// import 'dart:convert' show json;

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  var notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<SelfModel>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<SelfModel>(
          builder: (_, localNotifier, __) => ListView(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                color: Colors.grey[200],
                child: Text(
                  "> Status : ${localNotifier.isLogin ? "以登入" : "未登入"}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print(notifier.token);
                },
                child: Text('my anim -> ${localNotifier.token}'),
              ),
              myCard('USER', [
                [
                  "getToken",
                  [
                    "post",
                    "api-token-auth/",
                    {
                      "username": "asd8787449",
                      "password": "503wsi75",
                    },
                    t1,
                    t2
                  ]
                ],
                [
                  "print Users",
                  ['get', "api/user/", {}]
                ],
                [
                  "add User",
                  [
                    "post",
                    "api/user/",
                    {
                      "username": "asd87874491",
                      "password": "503wsi75",
                    }
                  ]
                ],
              ]),
              myCard('Collect', [
                [
                  "get user colelct",
                  [
                    "get",
                    "api/myCollect/",
                    {"hi":"aa"},
                    myCollectAnim,
                    getCollect,
                  ]
                ],
                [
                  "put user colelct",
                  [
                    "put",
                    "api/myCollect/",
                    {"collect": "[0,0,\"default\",\"987_789\",1]"},
                    myCollectAnim,
                    getCollect,
                  ]
                ],
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void myCollectAnim(data) {
    // data.headers = notifier.token; // 無奈 只好這樣
    // notifier.anim = notifier.anim==0? 1:0;
    notifier.myAnim();
  }

  void getCollect(data) {
    print("This is my data -> $data");
    print("my data type -> ${data.runtimeType}");
  }

  void t1(data) {
    print('request start!');
  }

  void t2(data) {
    print(data["token"]);
    notifier.getToken(data["token"]);
    notifier.notifyListeners();
  }

  // Future getTest(String method, String url, Map<String, dynamic> data, Function reqFunc, Function resFunc) async {
  //   print('request test');
  //   var myResponse;
  //   // FormData formData = FormData.fromMap(data);
  //   var myMethod = {"get": "GET", "post": "POST", "put": "PUT"}[method];
  //   print('my method is $myMethod');

  //   dio.interceptors.add(InterceptorsWrapper(
  //     onRequest:(RequestOptions options) async {
  //       // Do something before request is sent
  //       dio.interceptors.requestLock.lock(); // to prevent other request enter this interceptor.
  //       setState(() {connectMsg = "Connect...";});
  //       print( "Connect...");
  //       reqFunc();
  //       dio.interceptors.requestLock.unlock();
  //       return options; //continue
  //     },
  //     onResponse:(Response response) async {
  //       setState(() {connectMsg = "requset is success";  });

  //       print(response);
  //       return response; // continue
  //     },
  //     onError: (DioError err) async {
  //       // Do something with response error
  //       setState(() {connectMsg = "Connect ERROR";  });

  //       return  err;//continue
  //     }
  //   ));

  //   myResponse = await dio.request(
  //       url,
  //       data: FormData.fromMap(data),
  //       options: Options(method: myMethod),
  //   );
  // }
  Widget myCard(String title, List<List> textFunc) {
    return Card(
      color: Colors.grey[700],
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 5,
              children: List.generate(
                  textFunc.length, (index) => options(textFunc[index])),
            ),
          ],
        ),
      ),
    );
  }

  Widget options(textFunc) {
    // print('${optionIcon[optionData[itemIndex][optionIndex]]} -> ${optionData[itemIndex][optionIndex]}');
    return RaisedButton(
      onPressed: () => notifier.connectDio(textFunc[1][0], textFunc[1][1],
          textFunc[1][2], textFunc[1][3], textFunc[1][4]),
      child: Text(textFunc[0]),
    );
  }
}

// Future fetchAlbum(int value) async {
//   var dio = Dio();
//   List url = [
//     "signIn",
//     "test",
//   ];
//   // var cookieJar=CookieJar();
//   // dio.interceptors.add(CookieManager(cookieJar));

//   final response = await dio
//       .post(
//           // "http://192.168.43.159:8000/s/test/",
//           // "http://192.168.43.159:8000/user/${url[value]}/", // school url get json
//           "http://192.168.43.159:8000/api/isUser/", // school url get json
//           data: token
//           // queryParameters: {"id": 12, "name": "wendu"}
//           )
//       .timeout(const Duration(seconds: 5));

//   if (response.statusCode == 200) {
//     print('request success');
//     // return response.data["data"];
//     // return json.decode(response.data)["data"];
//   } else {
//     print('error');
//     // return null;
//     // throw Exception('Failed to load album');
//   }
// }
