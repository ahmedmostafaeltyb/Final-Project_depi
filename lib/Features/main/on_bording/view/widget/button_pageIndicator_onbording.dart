import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/sharde/widget/default_button.dart';
import '../onBordingScreesn.dart';

class ButtonPageIndicatorOnBording extends StatelessWidget {
  int textButton;
  Function submit;
  bool isLast;

  ButtonPageIndicatorOnBording({super.key,required this.isLast,required this.textButton,required this.submit});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: DefaultButton(text:(isLast == true)? 'تجربه سعيده':'التالى',function: (){

        bordcontroll.nextPage(
          duration: const Duration(
            milliseconds: 750,
          ),
          curve: Curves.easeInCubic,
        );
        if (isLast == true) {
          submit();
        }
      }
      ),);
  }
}