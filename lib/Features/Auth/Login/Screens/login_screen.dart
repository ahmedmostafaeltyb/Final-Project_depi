
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaith/Features/Auth/Login/Controller/login_view_cubit.dart';
import 'package:gaith/Features/Auth/Login/Controller/login_view_state.dart';
import 'package:gaith/Features/Auth/Register/Screens/register_screen.dart';
import 'package:gaith/Features/main/layoutScreen.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';

import '../../../../core/sharde/app_assets.dart';
import '../../../../core/sharde/chacheHelper.dart';
import '../../../../core/sharde/widget/consts.dart';
import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/text_forn_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var keyForm = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
          create: (context) => LoginViewCubit(),
          child: BlocConsumer<LoginViewCubit, LoginViewState>(

          listener: (context, state){
      if (state is LoginViewStateSuccess) {
        if (state.userLoginModel!.status==false) {
          Fluttertoast.showToast(
              msg: '${state.userLoginModel!.message}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {

          CacheHelper.saveData(
              key: 'uId', value: state.userLoginModel!.token)
              .then((value) {
            uId = CacheHelper.getData(key: 'uId');
            Fluttertoast.showToast(
                msg: '${state.userLoginModel!.message}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            navigatofinsh(context, LayoutScreen(), false);
          });

        }
      }
    },
    builder: (context, state){
    return

      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        
          Container(
                  height: MediaQuery.of(context).size.height *.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(25.sp),
                      bottomRight:Radius.circular(25.sp),
        
        
                    )
                    ,
                    color: Color(0xff22AAE4),
                  ),
        
        
                  child: Center(child: Image.asset(AppAssets.logo,width: 100.w,))),
            20.verticalSpace,
                    Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بعودتك',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
          fontFamily: 'Tajawal',
              ),),
              Icon(Icons.back_hand,color: Colors.amber,size: 30.sp,),
            ],
          ),
          20.verticalSpace,
          Form(
              key: keyForm,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اسم المستخدم',
                      style: TextStyle(
                        color: Color(0xff2B2B2B),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    CustomTextFormField(
                      hintText: 'البريد الإلكتروني',
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email is empty';
                        } else {
                          return null;
                        }
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'كلمة السر',
                      style: TextStyle(
                        color: Color(0xff2B2B2B),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    CustomTextFormField(
                      hintText: 'كلمة السر',
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password is empty';
                        } else {
                          return null;
                        }
                      },
                      subfix: IconButton(
                        onPressed: () {
                          BlocProvider.of<LoginViewCubit>(context)
                              .changIconPassword();
                        },
                        icon: Icon(
                          BlocProvider.of<LoginViewCubit>(context).subfix,
                          color: Color(0xff22AAE4),
                          size: 30.0,
                        ),
                      ),
                      textInputType: TextInputType.visiblePassword,
                      obscureText:
                      BlocProvider.of<LoginViewCubit>(context).isPassword,
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ConditionalBuilder(
                        condition: !(BlocProvider.of<LoginViewCubit>(context).state
                        is LoginViewStateLoading),
                        builder: (context) => DefaultButton(
                          text: 'تسجيل الدخول',
                          function: () {
                            if (keyForm.currentState!.validate()) {
                              BlocProvider.of<LoginViewCubit>(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5.0,
                            backgroundColor: Colors.black,
                            color: Colors.blue,
                            semanticsLabel: 'Linear progress indicator',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لديك حساب؟ ',
                          style: TextStyle(
                            color: Color(0xff2B2B2B),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                
                            navigato(context, RegisterScreen());
                          },
                          child: Text(
                            'تسجيل حساب جديد',
                            style: TextStyle(
                              color: Color(0xff22AAE4),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    }


          ),
      );
  }
}