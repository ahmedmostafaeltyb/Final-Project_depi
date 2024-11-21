import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:linear_progress_bar/linear_progress_bar.dart';


import '../../../core/sharde/app_assets.dart';
import '../../../core/sharde/app_colors.dart';
import '../../../core/sharde/widget/default_button.dart';
import '../../../core/sharde/widget/navigation.dart';
import '../payment/payment_screen.dart';
import 'cubit/home_view_cubit.dart';
import 'cubit/home_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DonationStatusDetails extends StatelessWidget {
  int id;
  DonationStatusDetails({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(


        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
          navigapop(context);
        },)
        ,

        title:  Text('تفاصيل الحاله',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
        centerTitle: true,),
      backgroundColor:  Color(0xffF4F6FE),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
        BlocProvider(
        create: (context) => DonorViewCubit()..getDetail(id: id),
        
            child: BlocConsumer<DonorViewCubit, DonorViewState>(
            listener: (context,state)
            {},
            builder:(context,state){
        
              return   ConditionalBuilder(
        
          condition: BlocProvider.of<DonorViewCubit>(context).detailsModel!=null,
        
          builder: (context){
            return   Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.img}',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        height: 200.h,
                      ),
                    ),

                    10.verticalSpace,
                    Container(

                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text( '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.name}',
                            style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),

                          ),
                          20.verticalSpace,
                          Text(
                            '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.des}'
                            ,
            style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14.sp,color: Color(0xff555555),fontWeight: FontWeight.w600)
            ) ),
                          10.verticalSpace,

                          Row(
                            children: [
                              Icon(FeatherIcons.phone,color: Color(0xff22AAE4),),
                              5.horizontalSpace,
                              Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.phone}', style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w600)
                              ))
                            ],
                          ),
                          5.verticalSpace,
                          Row(
                            children: [
                              Icon(FeatherIcons.map,color: Color(0xff22AAE4),),
                              5.horizontalSpace,
                              Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.address}',
                                  style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w600)
                                  ))
                            ],
                          ),

                          10.verticalSpace,

                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius:BorderRadius.circular(5),
                                    child: LinearProgressBar(
                                      maxSteps: int.parse( '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.price}'),
                                      progressType: LinearProgressBar.progressTypeLinear,
                                      currentStep:int.parse( '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.pay}'),
                                      progressColor:Color(0xff22AAE4),
                                      backgroundColor: Colors.black,

                                      minHeight: 15.h,

                                    ),
                                  ),
                                  Card(elevation:2,child: Container(width: 50.w,height:18.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff22AAE4)),child: Center(child:
                                  Text('${(int.parse('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.pay}')/int.parse('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.price}')
                                  )*100}%',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                                  ))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.pay}',  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff555555),

                                      fontFamily: 'Tajawal',
                                    ),),
                                    Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.price}',  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff555555),

                                      fontFamily: 'Tajawal',
                                    ),),

                                  ],
                                ),
                              ),
                            ],
                          ),




                          20.verticalSpace,
                        ],
                      ),
                    )


                  ,
                    Row(

                      children: [
                        Expanded(
                          flex: 3,
                          child: DefaultButton(text: 'مساعده الحاله',function: (){
                            navigato(context, PaymentScreen(donation_id:BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.id ,));
                            },),
                        ),
                        5.horizontalSpace,
                        Expanded(
                            flex: 1,
                            child:  Container(
                              decoration: BoxDecoration(
                                color:  Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              width: double.infinity,
                              height: 40.h,

                              child: MaterialButton(
                                  onPressed:(){

                                    BlocProvider.of<DonorViewCubit>(context).addCart(donationId: BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.id! );
                                  },
                                  child:
                                  Icon(Icons.add_shopping_cart, color: Color(0xff22AAE4),size: 25,)

                              ),
                            )
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            );
          },
        
          fallback: (context)
              {
        return Text('data');
        
              });
        
        
        
        
            }))
        
        ),
      ),
    );
  }
}


