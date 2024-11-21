
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';


import '../../Auth/register/screens/register_screen.dart';
class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Center(
        //   child: Image.asset(
        //       width: 120.w,
        //       AppAssets.volunter),
        // ),
        Center(
          child: Text(
            'تمت عمليه الدفع بنجاح',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 70.h),
        Center(
          child: ElevatedButton(
            onPressed: () {
             navigato(context, RegisterScreen());
            },
            style: ElevatedButton.styleFrom(

              backgroundColor:Colors.orange,
            ),
            child: Text('الـمـتـابـعـة',style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
