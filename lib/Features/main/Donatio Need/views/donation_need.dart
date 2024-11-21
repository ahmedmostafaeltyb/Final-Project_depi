import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/Donatio%20Need/views/widget/item_need_donation.dart';
import 'package:gaith/Features/main/Donatio%20Need/views/widget/personal%20_needs%20_page.dart';
import 'package:gaith/Features/main/Donatio%20Need/views/widget/report_need_page.dart';
import 'package:gaith/core/sharde/app_assets.dart';

class DonationNeedPage extends StatelessWidget {
  const DonationNeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
      width: MediaQuery.of(context).size.width,
       color:Color(0xffF4F6FE),
       child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [

          ItemNeedDonation(image: AppAssets.location_icon,text: 'تبليغ عن محتاج',screen: ReportNeedPage() ),
          20.verticalSpace,
          ItemNeedDonation(image: AppAssets.open_hand,text: 'إحتياج شخصي',screen: PersonalNeedsPage() ),






        ],
             ),
    );






  }
}

class C extends StatelessWidget {
  const C({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          color: Color(0xff529C9C),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(

              children: [
                Container(
                  height: MediaQuery.of(context).size.height *.2,

                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                    child: Center(child: Text('0xff529C9C')),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height  *.8,
                  width:MediaQuery.of(context).size.width ,

                  decoration: BoxDecoration(
                      color: Color(0xfffafafa),
                      borderRadius: BorderRadius.only(
                        topRight:Radius.circular(25.sp),
                        topLeft:Radius.circular(25.sp),


                      )
                  ),
                  child: Text('s'),
                )



              ],
            ),
          ),
        ),
      );

  }
}


