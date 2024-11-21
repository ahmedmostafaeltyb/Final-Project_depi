

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaith/Features/Auth/Login/Screens/login_screen.dart';
import 'package:gaith/Features/Auth/Register/Controller/register_view_cubit.dart';
import 'package:gaith/Features/Auth/Register/Controller/register_view_state.dart';
import 'package:gaith/core/sharde/widget/default_button.dart';

import '../../../../core/sharde/app_assets.dart';
import '../../../../core/sharde/widget/navigation.dart';
import '../../../../core/sharde/widget/text_forn_field.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  var nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
          create: (context) => RegisterViewCubit(),
          child: BlocConsumer<RegisterViewCubit, RegisterViewState>(
          listener: (context, state) {
      if (state is RegisterViewStateSuccess) {
        if (state.registerModel!.status == false) {
          Fluttertoast.showToast(
              msg: '${state.registerModel!.message}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {

          Fluttertoast.showToast(
              msg: '${state.registerModel!.message}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
          navigato(context, LoginScreen());
        }
      }
    }, builder: (context, state) {
    return

      Scaffold(
resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height *.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(25.sp),
                    bottomRight:Radius.circular(25.sp),
                  ),
                  color: Color(0xff22AAE4),
                ),
                child: Center(child: Hero(tag: 'Image',child: Image.asset(AppAssets.logo,width: 100.w,)))),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('انضم وشارك فى الخير',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                  fontFamily: 'Tajawal',
                ),),
                Icon(Icons.back_hand,color: Colors.amber,size: 30.sp,),
              ],
            ),
      Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('اسم المستخدم',


                style: TextStyle( color: Color(0xff2B2B2B),

                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',),),
              CustomTextFormField(
                hintText: 'الاسم',
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
                hintText: 'البريد الإلكتروني',
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
              Text('كلمة السر',


                style: TextStyle( color: Color(0xff2B2B2B),

                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',),),
              CustomTextFormField(
                hintText: 'كلمة السر',
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password is  empty';
                  } else {
                    return null;
                  }
                },
                subfix: IconButton(onPressed: (){
                  BlocProvider.of<RegisterViewCubit>(context).changIconPassword();
                },
                  icon: Icon(BlocProvider.of<RegisterViewCubit>(context).subfix,color: Color(0xff22AAE4 ),size: 30.0),),

                textInputType: TextInputType.visiblePassword,
                obscureText:BlocProvider.of<RegisterViewCubit>(context).isPassword,

              ),
              Text('تأكيد كلمة السر',


                style: TextStyle( color: Color(0xff2B2B2B),

                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',),),
              CustomTextFormField(
                hintText: 'تأكيد كلمة السر',
                controller: confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirm Password is  empty';
                  } else {
                    return null;
                  }
                },
                subfix: IconButton(onPressed: (){
                  BlocProvider.of<RegisterViewCubit>(context).changIconPassword();
                },
                  icon: Icon(BlocProvider.of<RegisterViewCubit>(context).subfix,color: Color(0xff22AAE4 ),size: 30.0),),

                textInputType: TextInputType.visiblePassword,
                obscureText:BlocProvider.of<RegisterViewCubit>(context).isPassword,

              ),
              Text('رقم الموبايل',


                style: TextStyle( color: Color(0xff2B2B2B),

                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',),),
              CustomTextFormField(
                hintText: 'رقم الموبايل',
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
              Text( 'العنوان',


                style: TextStyle( color: Color(0xff2B2B2B),

                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',),),
              CustomTextFormField(
                hintText: 'العنوان',
                controller: addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'address is  empty';
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.streetAddress,
              ),
              20.verticalSpace,

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConditionalBuilder(
                  condition:state is !RegisterViewStateLoading,

                  builder: (context) =>DefaultButton(text: 'إنشاء حساب',function: (){
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<RegisterViewCubit>(context).userRegister(
                          address: addressController.text,
                          name:nameController.text ,

                          phone:mobileNumberController.text ,

                          password_confirmation:confirmPasswordController.text ,


                          email:emailController.text,

                          password: passwordController.text

                      );
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

              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'هل لديك حساب بالفعل',
                    style: TextStyle( color: Color(0xff2B2B2B),

                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: 'Tajawal',),),
                  TextButton(
                    onPressed: () {
                      navigatofinsh(context, LoginScreen(), false);

                    },
                    child: Text('تسجيل دخول',
                      style: TextStyle( color: Color(0xff22AAE4),

                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        fontFamily: 'Tajawal',),),
                  ),
                ],
              ),

            ],
          ),
        ),

      )
          ],
        ),
      )
    );
          }),
      );
  }
}
