import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/sharde/app_assets.dart';
import '../../../../core/sharde/widget/consts.dart';
class CardCart extends StatelessWidget {
  int idDonation;
  String image;
  int price;
  String ?title;
   CardCart({super.key,required this.idDonation,required this.image,required this.price,required this.title});

  @override
  Widget build(BuildContext context) {
    return
      Container(

        padding:EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child:
        Row(

          children: [
            Expanded(flex: 1,child: Image.network(image)),
           10.horizontalSpace,
            Expanded(
              flex: 2,
              child: Column(

         crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                Text(title.toString(),style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w700))) ,
                   5.verticalSpace,
                    Row(
                      children: [
                        Text(price.toString(),style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w500))),
                        5.horizontalSpace,
                        Text('جنيه مصرى',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w700))) ,
                      ],
                    ) ,
              ],),

            ),

          ],
        ),
      );
  }
}