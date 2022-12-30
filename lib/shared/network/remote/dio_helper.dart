import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
class DioHelper
{
static Dio? dio;
static init()
{
    dio=Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.4:8080/api/',
      receiveDataWhenStatusError: true,
    )
  );
}
Future<Response?> getData({
  required String url,
  required Map<String, dynamic> query,
}) async
{
  return await dio?.get(url,queryParameters: query,);
}

}