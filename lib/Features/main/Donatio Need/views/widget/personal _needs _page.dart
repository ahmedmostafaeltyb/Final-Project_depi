

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/sharde/app_assets.dart';
import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/text_forn_field.dart';
import '../../../layoutScreen.dart';
import '../../manager/donation_need_cubit.dart';
import '../../manager/donation_need_state.dart';

class PersonalNeedsPage extends StatelessWidget {
   PersonalNeedsPage({super.key});
   var descriptionController=TextEditingController();
   var keyForm = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:const Color(0xffF4F6FE),
      appBar: AppBar(


        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
          navigapop(context);
        },)
        ,

        title:  Text('احتياج شخصى',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
        centerTitle: true,),
      body:

      BlocProvider(
        create: (context) => DonationNeedViewCubit(),
        child: BlocConsumer<DonationNeedViewCubit,DonationNeedViewState>(
          listener: (context,state)
          {
            if (state is RequestADonationForMeStateSuccess) {
              if(state.successMeModel2!.status==false)
              {

                Fluttertoast.showToast(
                    msg: '${state.successMeModel2!.message}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);

              }
              else{

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: Colors.white,

                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppAssets.success),

                        Text('${state.successMeModel2!.message}',  style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Ottoman',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('تم تسجيل طلبك بنجاح',  style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Ottoman',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('سيتم مراجعه طلبك والتواصل معك فى اقرب وقت ممكن ', style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Ottoman',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),


                  ),
                );


              }




            }

            if(state is RequestADonationForMeStateError)
            {
              ScaffoldMessenger.of(context).showSnackBar(

                SnackBar(backgroundColor: Colors.red,content: Text('لم يتم تنفيذ التبرع حاول مره اخرى وتاكد من الانترنت')),
              );
            }









          },
          builder: (context,  state) {

            return   Form(
              key:keyForm ,
              child: Column(
                children: [

                  if(BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!=null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0), // تعديل نسبة القطع حسب الحاجة
                          child: Image.file(
                            File(BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  if(BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto==null)
                    100.verticalSpace,
                  CustomTextFormField(hintText: 'نبذه عن احتياجك للتبرع ',
                    controller:descriptionController,
                    validator:(value) {
                      if (value!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      } else {
                        return null;
                      }
                    },
                    textInputType: TextInputType.text,),
                    5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      InkWell(onTap:(){

                        BlocProvider.of<DonationNeedViewCubit>(context).getProfileImageByCamera();
                      } ,child: Icon(Icons.camera_alt,color: Color(0xff529C9C),)),
                      InkWell(onTap:(){

                        BlocProvider.of<DonationNeedViewCubit>(context).getProfileImageByGallery();



                      } ,child: Image.asset(AppAssets.Attachphoto)),


                    ],
                  ),




                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ConditionalBuilder(
                      condition:state is !RequestADonationForMeStateLoading,

                      builder: (context) =>DefaultButton(text: 'تأكيد',function: (){
                        if (keyForm.currentState!.validate()) {




                          BlocProvider.of<DonationNeedViewCubit>(context).requestADonationForMe(
                            image:BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto ,
                            categoryId:'16' ,
                            description:descriptionController.text ,
                            details:descriptionController.text,


                            price: '0',  );
                        }

                      },),
                      fallback:(context) => const Center(child: CircularProgressIndicator(
                        strokeWidth: 5.0,
                        backgroundColor: Colors.black,
                        color: Colors.blue,

                        semanticsLabel: 'Linear progress indicator',

                      ) ,

                      ),
                    ),

                  ),
                ],
              ),
            );
          },


        ),
      ),
    );
  }
}
