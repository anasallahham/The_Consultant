import 'package:dio/dio.dart';
//import 'package:project/networks/local/cache.dart';


class DioHelper
{

  static late Dio  dio;

 static void init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl:'http://192.168.1.4:8080/api/',
        receiveDataWhenStatusError: true
      )
    );
    dio.options.connectTimeout = 10000;
  }


 static Future <Response>postData
      (
  {
    required  url,
    required  data
  }
      )
 async
  {
    dio.options.headers=
    {
      'Accept': 'application/json',
      //'Authorization':'Bearer ${CacheHelper.getData(key: 'token')}'
    };
   return  await dio.post(url,data: data);
  }

static Future<Response> getData(
  {
  required url
}
    )async{
  dio.options.headers=
  {
    'Accept':'application/json',
    //'Authorization':'Bearer ${CacheHelper.getData(key: 'token')}'
  };
   return await dio.get(url);
}


  static Future<Response> deleteData ({
    required String url,
  })async
  {
    dio.options.headers =
    {

      'Accept': 'application/json',
      //'Authorization':'Bearer ${CacheHelper.getData(key: 'token')}'
    };

    return dio.delete(url);
  }


}