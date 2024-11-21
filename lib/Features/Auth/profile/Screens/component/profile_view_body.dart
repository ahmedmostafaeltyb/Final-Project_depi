
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/Auth/profile/Screens/component/profile_field.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/sharde/widget/navigation.dart';




class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(

          backgroundColor: Color(0xffF4F6FE),
          appBar: AppBar(
backgroundColor: Color(0xffF4F6FE),

            leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,),onPressed: (){
              navigapop(context);
            },)
            ,

            title:  Text('الملف الشخصى',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
            centerTitle: true,),
body:SingleChildScrollView(
physics: BouncingScrollPhysics(),
child: ProfileField())



    );
  }
}




