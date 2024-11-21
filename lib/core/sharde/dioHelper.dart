
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gaith/core/sharde/widget/consts.dart';


class DioHelper{

  static late Dio dio;
  static init()
  {
    dio=Dio(BaseOptions(baseUrl:'http://test.tmwenatapp.com/api/',
    receiveDataWhenStatusError: true,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        // 'Content-Type': 'multipart/form-data',

     }


    ));

  }

  static Future<Response>getData({required String url,Map<String,dynamic>? query})async
  {
     dio.options.headers["Authorization"] = "Bearer ${uId}";
   return await dio.get(url,queryParameters: query);
  }

  static Future<Response>postData({required String url, dynamic data, String?token })async
  {
     dio.options.headers["Authorization"] = "Bearer ${uId}";
    return   dio.post(url,data: data);
  }

  static Future<Response>putData({required String url,Map<String,dynamic> ?data,String?token })async
  {

    return   dio.put(url,data: data);
  }

}