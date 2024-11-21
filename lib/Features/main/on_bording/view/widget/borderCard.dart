import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../model/list_on_bording.dart';
class  BorderCard extends StatelessWidget {
  int index;
  BorderCard({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // SizedBox(height:100.h ,child: Text(BordingList[index].title)),
          Container(height: 300.h,width: double.infinity,child: Image.asset(BordingList[index].image)),
          SizedBox(
            height: 5.h,
          ),

10.verticalSpace,
          SizedBox(height: 100.h,child: Text(BordingList[index].body,style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)))),
        ],
      ),
    );
  }
}
