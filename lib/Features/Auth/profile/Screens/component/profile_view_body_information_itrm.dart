import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/sharde/widget/styles.dart';


class ProfileViewBodyInformationItem extends StatelessWidget {
  final String labelText;
  final String text;
  const ProfileViewBodyInformationItem({super.key,  required this.labelText,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(labelText,style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 15.sp,
      fontFamily: 'Tajawal',
    ),),
     5.verticalSpace,
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            border: Border.all(
              color: Color(0xff22AAE4),
              width: 1.0,
            ),
          ),

          child: Align(
              alignment: Alignment.centerRight,child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(text,style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              fontFamily: 'Tajawal',
            ),),
          )),
        )
      ],
    );
  }
}