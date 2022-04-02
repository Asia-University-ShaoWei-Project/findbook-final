import 'package:dio/dio.dart';

Future fetchAlbum(String url) async {
  var dio = Dio();
  final response = await dio.get(url).timeout(const Duration(seconds: 10));
  if (response.statusCode == 200) {
    return response.data;
  } else {
    return null;
  }
}
