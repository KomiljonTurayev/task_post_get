import 'package:dio/dio.dart';
import 'package:task_post_get/utils/tools.dart';

Dio dio = new Dio();

Future postData() async {
  dynamic data = {
    'title': 'Flutter Http post',
    'body': 'Flutter is awesome',
    'userId': 10,
  };

  var response = await dio.post(baseUrl,
      data: data,
      options: Options(headers: {
        'Content-type': 'application/json; charset=UTF-8',
      }));

  return response.data;
}

Future getData() async {
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions option) async {
    var headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': ''
    };
    option.headers.addAll(headers);
    return option.data;
  }));

  Response response = await dio.get(baseUrl + "/10");
  return response.data;
}
