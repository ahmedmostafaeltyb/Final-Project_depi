import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/sharde/app_assets.dart';
import '../../../../core/sharde/widget/navigation.dart';
class PaymentErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Color(0xffF4F6FE),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F6FE),

        leading: IconButton(icon: Icon(Icons.close,size: 30,),onPressed: (){
          navigapop(context);
        },)
        ,

        title:  Text('عملية لم تنجح',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
        centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Center(child:
          Image.asset(AppAssets.error,width: 100.w,height: 200.h,),
       ),
          20.verticalSpace,
          Column(
            children: [
              Text('لقد تم رفض عملية الدفع ',
                style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
              5.verticalSpace,
              Text('ليست ناجحه',
                style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.red,fontWeight: FontWeight.w700)),),
            ],
          )
        ],
      ),
      bottomSheet: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xff22AAE4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                          'العوده الى الصفحه السابقه',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Monadi',
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}