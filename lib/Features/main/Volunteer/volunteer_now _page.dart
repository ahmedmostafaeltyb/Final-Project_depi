import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaith/Features/main/Volunteer/cubit/volunteer_view_cubit.dart';
import 'package:gaith/Features/main/Volunteer/cubit/volunteer_view_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/sharde/widget/default_button.dart';
import '../../../core/sharde/widget/navigation.dart';
import '../../../core/sharde/widget/text_forn_field.dart';
class VolunteerNowPage extends StatelessWidget {
  var nameController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  var addressController = TextEditingController();
  var ageController = TextEditingController();
  var occupationController = TextEditingController();
  var experienceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor:Color(0xffF4F6FE),
          appBar: AppBar(
            backgroundColor:Color(0xffF4F6FE),

            leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
              navigapop(context);
            },)
            ,

            title:  Text('متطوع',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
            centerTitle: true,),
        body:
    BlocProvider(

    create: (context) => VolunteerViewCubit(),

    child: BlocConsumer<VolunteerViewCubit, VolunteerViewState>(
    listener: (context,state)
    {

      if (state is AddVolunteerViewStateSuccess) {
        if(state.volunteerSuccessModel!.status==false)
          {

            Fluttertoast.showToast(
                msg: '${state.volunteerSuccessModel!.message}',
                toastLength: Toast.LENGTH_SHORT,

                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);

          }
        else{
          Fluttertoast.showToast(
              msg: '${state.volunteerSuccessModel!.message}',
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          navigapop(context);

        }




        }


    },
    builder:(context,state)
    {

    return
        Form(
          key: keyForm,
          child: SingleChildScrollView(
            child: Column(
              children: [
            
                30.verticalSpace,

                CustomTextFormField(

                  hintText: 'الاسم',
                  controller: nameController,
                  validator:(value) {
                  if (value!.isEmpty) {
                  return 'name is  empty';
                  } else {
                  return null;
                  }
                  },
                textInputType: TextInputType.name,),
                CustomTextFormField(hintText: 'العنوان',controller
                    : addressController,validator:(value) {
                  if (value!.isEmpty) {
                    return 'address is  empty';
                  } else {
                    return null;
                  }
                },
                  textInputType: TextInputType.streetAddress,),
                CustomTextFormField(hintText: 'العمر',controller: ageController,validator:(value) {
                  if (value!.isEmpty) {
                    return 'age is  empty';
                  } else {
                    return null;
                  }
                },
                  textInputType: TextInputType.number,),
                CustomTextFormField(hintText: 'المهنه',controller:occupationController,validator:(value) {
                  if (value!.isEmpty) {
                    return 'occupation is  empty';
                  } else {
                    return null;
                  }
                },
                  textInputType: TextInputType.text,),
                CustomTextFormField(hintText: 'الخبرات',controller: experienceController,validator:(value) {
                  if (value!.isEmpty) {
                    return 'experience is  empty';
                  } else {
                    return null;
                  }
                },
                  textInputType: TextInputType.text,),
            
                20.verticalSpace,
            
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ConditionalBuilder(
                    condition:state is !AddVolunteerViewStateLoading,
            
                    builder: (context) =>DefaultButton(text: 'تطوع',function: (){
                      if (keyForm.currentState!.validate()) {
                        BlocProvider.of<VolunteerViewCubit>(context).addVolunteer(
            name: nameController.text,
                          address: addressController.text,
            age: ageController.text,
            ex: experienceController.text,
            work:    occupationController.text,
            volunteer_id:            '5'

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
            
              ],
            ),
          ),
        );
    }


    ),
    )
    );
  }
}