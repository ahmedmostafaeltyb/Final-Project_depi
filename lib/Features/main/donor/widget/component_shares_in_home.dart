import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/navigation.dart';
import '../../payment/payment_screen.dart';
import '../model/shares_model.dart';
class ComponentSharesInHome extends StatelessWidget {

  SharesModel?shareModelInHome;
  var index;
  ComponentSharesInHome({super.key,required this.index,required this.shareModelInHome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: MediaQuery.of(context).size.width*.8,
        decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:MediaQuery.of(context).size.width*.4,child: ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(10.sp),
              topRight:Radius.circular(10.sp),
            ),child:(shareModelInHome!.shares![index].img==null)?
            CircularProgressIndicator(
              value: 0.7,
            ):
            Image.network('${shareModelInHome!.shares![index].img}',width: double.infinity,fit: BoxFit.cover,))),

            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${shareModelInHome!.shares![index].name}',

                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Tajawal',
                            color: Color(0xff095372)
                        ),
                      ),
                    Text(
                      maxLines: 2,

                      '${shareModelInHome!.shares![index].dec}',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12.sp,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.price_change,color: Colors.amber,),
                        5.horizontalSpace,
                        Text(


                          '${shareModelInHome!.shares![index].price}',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        2.horizontalSpace,
                        Text(


                          'جنيه مصرى',
                          style: TextStyle(

                            fontSize: 14.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ],
                    ),
                    DefaultButton(function: (){

                      navigato(context, PaymentScreen(donation_id:shareModelInHome!.shares![index].id! ,price:shareModelInHome!.shares![index].price ,));
                    },text: 'تبرع',),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}