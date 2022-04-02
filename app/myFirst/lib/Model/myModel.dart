import 'package:flutter/cupertino.dart';

// import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

// const _token = "Token 3a11ce5b45e176eeaf94d4030356d41c6b882533";


// --------------dio-------------------
// ------------------------------------



BaseOptions baseOptions = new BaseOptions(
    baseUrl: "http://210.70.80.111/",
    // baseUrl: "http://192.168.43.159:8000/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
);
  // connectOptions.

class MyModel extends ChangeNotifier {
  String _token = "";   // user token auth
  String get token => _token;

  // --------------HOME-------------------------------
  int _page = 0;
  int advLen = 0;         // advertising count
  int get page => _page;  // switch page value

  // --------------User-------------------------------
  String _username="";
  String _collect = ""; // user collect data
  String get username => _username;
  Map<String, List> get collect => json.decode(_collect);

  // --------------Search-------------------------------
  String _searchHistory = "";    // search history<key & date>

  // String get collect => _collect;
  // Map<String, List> get searchHistory => _searchHistory??json.decode(_searchHistory);
  List<dynamic> searchHistory;
  bool get isLogin => _token!=null? true:false;
  bool test = false;
  Dio dio = new Dio(baseOptions);

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> getProfile() async {
    print("event getProfile()");
    
    final SharedPreferences prefs = await _prefs;
    // List<Map<String, String>> aaa = [{"key":"best python","date":"19/12/04"},{"key":"best python","date":"19/01/29"},{"key":"best java","date":"19/06/05"},];
    // prefs.setString("history", json.encode(aaa));
    _token = prefs.getString('token');
    _collect = prefs.getString('collect');
    _searchHistory = prefs.getString('history');
    _username = prefs.getString('username');

    searchHistory = _searchHistory!=null? json.decode(_searchHistory):[];
    // searchHistory = _searchHistory.isNotEmpty? []:json.decode(_searchHistory);


    // print("SharedPreferences token($token), collect($collect), user($user)");
    print("is Login?? $isLogin.${isLogin? "以登入":"未登入"}.");
    print("is Login?? ${isLogin? "以登入":"未登入"}.");
    // _counter = prefs.setInt("counter", counter).then((bool success) {return counter; });
  }
  // ------------------------------------
  // --------------dio-------------------
  var connectMsg = "Idle";
  var info = '123';
  var anim = 0;

  myAnim(){
    print("event myAnim()");

    anim += 1;
    notifyListeners();
  }

  getToken(data) async{
    print("event getToken()");
    Map<String, List<Map>> a = {
      "default":[
        {
          "id": "id1",
          "title": "this is title1",
          "url": "url1",
          "au": "au1",
          "pub": "pub1",
          "date": "date1",
        },
        {
          "id": "id2",
          "title": "this is title2",
          "url": "url2",
          "au": "au2",
          "pub": "pub2",
          "date": "date2",
        }
      ],
      "python":[],
      "java":[],
    };
    final SharedPreferences prefs = await _prefs;
    prefs.setString("token", data);
    prefs.setString("collect", json.encode(a));
    getProfile();
  }

  

  connectDio(String method, String url, Map<String, dynamic> data, dynamic reqFunc, dynamic resFunc) async {
    print("event connectDio");

    // FormData formData = FormData.fromMap(data);
    final  myMethod = {"get": "GET", "post": "POST", "put": "PUT"}[method];
    print('my method is $myMethod');
    

    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options) async {
        // Do something before request is sent
        dio.interceptors.requestLock.lock(); // to prevent other request enter this interceptor.
        print( "dio start onRequest()...");
        print("my options ->${options.baseUrl}");
        print("my options ->${options.headers}");
        print("my token ->$token");
        options.headers = {"Authorization": "Token $token"};
        print("my options ->${options.headers}");

        reqFunc(options);
        notifyListeners();
        dio.interceptors.requestLock.unlock();
        // return options; //continue
        return ; //continue
      },
      onResponse:(Response response) async {
        print("dio start onResponse()");
        resFunc(response.data);
        // return response; // continue
        return ; // continue
      },
      onError: (DioError err) async {
        // Do something with response error
        print("dio start onError()");
        return  err;//continue
      }
    ));


    await dio.request(
        url,
        data: FormData.fromMap(data),
        options: Options(method: myMethod),
    );
  }

  // List<Map<String, dynamic>> get  = _data;

  // MyChangeNotifier(this._data);

  barPage(int value) {
    print("event barPage($value)");
    _page = value;
    notifyListeners(); //要更新UI记得调用这个方法
  }











}
