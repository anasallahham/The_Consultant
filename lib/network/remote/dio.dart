import 'package:dio/dio.dart';
import 'package:the_consultant/network/local/cache.dart';



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
    // dio.options.headers=
    // {
    //   'Accept': 'application/json',
    //   'Authorization':'${CacheHelper.getData(key: 'token')}'
    // };

    print(CacheHelper.getData(key: 'token'));
     dio.options.headers.addAll({
       'Accept': 'application/json',
    //  'Authorization':'${CacheHelper.getData(key: 'token')
  //    }'

     });
    try{
      Response response= await dio.post(
        url,
        data: data,
      );
      print ("response=${response.data}");
      return response;
    }
catch(e){
    print(e.toString());
    throw Exception();
}

  }

  static Future<Response> getData(
      {
        required url
      }
      )async{
    dio.options.headers=
    {
      'Accept':'application/json',
      'Authorization':'Bearer ${CacheHelper.getData(key: 'token')}'
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
      'Authorization':'Bearer ${CacheHelper.getData(key: 'token')}'
    };

    return dio.delete(url);
  }


}


//****




