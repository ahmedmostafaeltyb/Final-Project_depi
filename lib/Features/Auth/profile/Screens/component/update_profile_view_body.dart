
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/navigation.dart';
import '../../../../../core/sharde/widget/styles.dart';
import '../../../../../core/sharde/widget/text_forn_field.dart';
import '../../../../main/layoutScreen.dart';
import '../../Controller/profile_view_cubit.dart';
import '../../Controller/profile_view_state.dart';
import '../../model/profile_model.dart';

class UpdateProfileViewBody extends StatelessWidget {
  // UserRegisterModel? updateUser;

  ProfileModel?updateProfileModel;
  UpdateProfileViewBody({super.key,required this.updateProfileModel});
  var keyForm=GlobalKey<FormState>();
  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();


  @override

  Widget build(BuildContext context) {
    nameController.text = updateProfileModel!.user!.name ?? '';
    mobileNumberController.text=updateProfileModel!.user!.phone ?? '';
    emailController.text=updateProfileModel!.user!.email ?? '';

    return

      BlocProvider(
        create: (context)=>ProfileViewCubit(),
        child: BlocConsumer<ProfileViewCubit,ProfileViewState>(
          listener: (context,state){
// if(state is )



          },
          builder: (context,state){
            var contextProfile=BlocProvider.of<ProfileViewCubit>(context);
            return  ConditionalBuilder(  condition:true ,
                builder:(context) {

                  return Scaffold(
                      backgroundColor: Color(0xffF4F6FE),
                      appBar: AppBar(
                        backgroundColor: Color(0xffF4F6FE),

                        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,),onPressed: (){
                          navigatofinsh(context, LayoutScreen(), false);
                        },)
                        ,

                        title:  Text('تعديل الملف الشخصى',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
                        centerTitle: true,),

                      body: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: keyForm,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Center(
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50.sp),
                                              color:  Color(0xff22AAE4)

                                          ),


                                          child:
                                          (contextProfile.ImageEditProfilePhoto==null)?
                                          CircleAvatar(
                                              backgroundImage:  NetworkImage('${updateProfileModel!.user!.img}'),
                                              radius: 50.0.sp
                                          )
                                          :
                                          CircleAvatar(
                                              backgroundImage:FileImage(
                                                  File(contextProfile.ImageEditProfilePhoto!.path)),
                                              radius: 50.0.sp
                                          )
                                          ,
                                        ),
                                        InkWell(
                                          onTap: (){

                                            contextProfile.getProfileImageByGallery();
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(20)
                                              ),child: Icon(Icons.edit,  color:  Color(0xff22AAE4),)),
                                        )
                                      ],
                                    ),
                                  ),

                                  Text('اسم المستخدم',


                                    style: TextStyle( color: Color(0xff2B2B2B),

                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      fontFamily: 'Tajawal',),),
                                  CustomTextFormField(
                                    hintText: 'ادخل الاسم ',
                                    controller: nameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'name is  empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textInputType: TextInputType.name,
                                  ),
                                  Text('البريد الإلكتروني',


                                    style: TextStyle( color: Color(0xff2B2B2B),

                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      fontFamily: 'Tajawal',),),
                                  CustomTextFormField(
                                    hintText: 'ادخل البريد الالكترونى',
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'email is  empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textInputType: TextInputType.emailAddress,
                                  ),

                                  Text('رقم الموبايل',


                                    style: TextStyle( color: Color(0xff2B2B2B),

                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      fontFamily: 'Tajawal',),),
                                  CustomTextFormField(
                                    hintText: 'رقم الهاتف',
                                    controller: mobileNumberController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Mobile Number is  empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textInputType: TextInputType.phone,
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ConditionalBuilder(
                                      condition: !(BlocProvider.of<ProfileViewCubit>(context).state
                                      is EditProfileViewStateLoading),

                                      builder: (context) =>DefaultButton(text: ' تاكيد تعديل الملف الشخصى',function: (){
                                        if (keyForm.currentState!.validate()) {
contextProfile.editeProfileData(context: context,name: nameController.text, phone:mobileNumberController.text, email:emailController.text,image: contextProfile.ImageEditProfilePhoto );
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
                            ),
                          ),
                        ),
                      )
                  );


                },
                fallback:(context)=>const Center(child: CircularProgressIndicator()));
          },


        ),
      );


    }
}