import 'package:flutter/material.dart';

import '../../../Features/Auth/login/screens/login_screen.dart';
import '../chacheHelper.dart';
void SingOut(context)
{
  CacheHelper.removeData(key: 'uId').then((value) {
    if (value) {
      print('log out');
   print(CacheHelper.getData(key: 'uId'));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) =>   LoginScreen()), (
          route) => false);
     }
   });
}