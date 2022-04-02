// import 'package:flutter/cupertino.dart';
// // import 'package:provider/provider.dart';
// import 'package:dio/dio.dart';

// const _token = "Token 3a11ce5b45e176eeaf94d4030356d41c6b882533";

// // --------------dio-------------------
// BaseOptions connectOptions = new BaseOptions(
//       baseUrl: "http://192.168.43.159:8000/",
//       headers: {"Authorization": _token},
//       connectTimeout: 5000,
//       receiveTimeout: 3000,
//   );
// final Dio dio = new Dio(connectOptions);
// // ------------------------------------

// class CollectModel extends ChangeNotifier {
//   int _page = 0;
//   int get page => _page;
//   int advLen = 0;

//   // --------------dio-------------------
//   var connectMsg = "Idle";
//   var info = '123';

//   var anim = 0;

//   myAnim(){
//     anim += 1;
//     notifyListeners();
//   }

  

//   getTest(String method, String url, Map<String, dynamic> data, dynamic reqFunc, dynamic resFunc) async {
//     print('request test');
//     // FormData formData = FormData.fromMap(data);
//     var myMethod = {"get": "GET", "post": "POST", "put": "PUT"}[method];
//     print('my method is $myMethod');

//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest:(RequestOptions options) async {
//         // Do something before request is sent
//         dio.interceptors.requestLock.lock(); // to prevent other request enter this interceptor.
//         print( "Connect...");
//         reqFunc();
//         notifyListeners();
//         dio.interceptors.requestLock.unlock();
//         // return options; //continue
//       },
//       onResponse:(Response response) async {
//         resFunc(response);
//         // return response; // continue
//       },
//       onError: (DioError err) async {
//         // Do something with response error
//         return  err;//continue
//       }
//     ));


//     await dio.request(
//         url,
//         data: FormData.fromMap(data),
//         options: Options(method: myMethod),
//     );
//   }
//   // ------------------------------------

//   // List<Map<String, dynamic>> get  = _data;

//   // MyChangeNotifier(this._data);

//   barPage(int value) {
//     _page = value;
//     notifyListeners(); //要更新UI记得调用这个方法
//   }









// }
