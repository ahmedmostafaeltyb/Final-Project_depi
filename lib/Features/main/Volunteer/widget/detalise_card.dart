import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/sharde/widget/default_button.dart';
import '../model/volunteer_model.dart';
import '../volunteer_now _page.dart';

class DetaliseCard extends StatelessWidget {
  Volunteers volunteerModel;
  DetaliseCard({super.key,required this.volunteerModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 5.h,),
          Text('${volunteerModel.name}',
            style:GoogleFonts.cairo(textStyle: TextStyle(
                fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold)),



    ),
          Text('${volunteerModel.dec}',
            maxLines:2,style:TextStyle(

            overflow: TextOverflow.ellipsis,
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Tajawal',
          ),
    ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(function: (){
              navigato(context, VolunteerNowPage());


            },text: 'تطوع الان',),
          )
        ],
      ),
    );
  }
}