
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/sharde/chacheHelper.dart';
import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/navigation.dart';
import '../../../Auth/login/screens/login_screen.dart';
import '../model/list_on_bording.dart';
import 'widget/borderCard.dart';
import 'widget/button_pageIndicator_onbording.dart';
import 'widget/smooth_pageIndicator_onbording.dart';




var bordcontroll = PageController();

class OnBordingScreen extends StatefulWidget {
  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  bool isLast = false;
  int textButton=0;

  @override
  void submit() {
    CacheHelper.saveData(key: 'onBording', value: true).then((value) {
      if (value) {
        navigatofinsh(context,LoginScreen(), false);

       }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      


      body: 
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(AppAssets.bording),
            fit: BoxFit.fitHeight,
          ),

        ),
        child:
       Column(

         children: [

          60.verticalSpace,
           Expanded(
             child: PageView.builder(
               onPageChanged: (index) {
                 textButton=index;
                 if (index == BordingList.length - 1) {
                   setState(() {
                     isLast = true;
                   });
                 } else {
                   setState(() {
                     isLast = false;
                   });
                 }
               },
               controller: bordcontroll,
               physics: const BouncingScrollPhysics(),
               itemBuilder: (context, index) =>  BorderCard(index: index),
               itemCount: BordingList.length,
             ),
           ),
           20.verticalSpace,

           SmoothPageIndicatorOnBording(),
           20.verticalSpace,
           ButtonPageIndicatorOnBording(isLast: isLast,submit: submit,textButton: textButton),
         20.verticalSpace,


         ],
       )

      ),
    );
  }
}




