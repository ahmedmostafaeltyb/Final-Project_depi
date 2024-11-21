import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
class ItemNeedDonation extends StatelessWidget {
  String image;
  String text;
  Widget screen;
  ItemNeedDonation({super.key,required this.image,required  this.text,required this.screen});



  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        navigato(context, screen);
      },
      child: Container(
        width: 150.w,
        height: 100.h,
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
        ),


        padding: EdgeInsets.all(8),
        child: Column(
          children: [

            Text(text,style:  TextStyle(
              color: Colors.black,

              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',


            ),),
            Image.asset(image,width: 50.w,height: 50.h),
          ],
        ),
      ),
    );
  }
}