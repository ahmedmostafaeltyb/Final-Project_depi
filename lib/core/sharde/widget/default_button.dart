

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function function;
  DefaultButton({required this.text,required this.function});
  @override
  Widget build(BuildContext context) {
    return
        Center(
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all( Color(0xff22AAE4),),              ),
                onPressed:(){function();},
                child: Text(
                text,
            
                style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Tajawal',
                ),)
                  ),
          ),
        );


  }
}
