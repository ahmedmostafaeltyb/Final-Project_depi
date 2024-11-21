import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/text_forn_field.dart';
class RepresentativePage extends StatelessWidget {
  RepresentativePage({super.key});
  var personalNameController=TextEditingController();
  var personalPhoneController=TextEditingController();
  var addressController=TextEditingController();
  var descriptionController=TextEditingController();
  bool accountInformation = false;
  var keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar() ,
      body: Column(
        children: [
          CustomTextFormField(hintText: 'من فضلك ادخل اسمك ',
            controller:personalNameController,
            validator:(value) {
              if (value!.isEmpty) {
                return 'حقل الاسم مطلوب';
              } else {
                return null;
              }
            },
            textInputType: TextInputType.name,
          ),
          CustomTextFormField(hintText: 'رقم موبيلك ',
            controller:personalPhoneController,
            validator:(value) {
              if (value!.isEmpty) {
                return 'حقل الاسم مطلوب';
              } else {
                return null;
              }
            },
            textInputType: TextInputType.phone,),
          CustomTextFormField(hintText: 'عنوان الحاله ',
            controller:addressController,
            validator:(value) {
              if (value!.isEmpty) {
                return 'حقل الاسم مطلوب';
              } else {
                return null;
              }
            },
            textInputType: TextInputType.text,),
          CustomTextFormField(hintText: 'نبذه عن احتياجك للتبرع ',
            controller:descriptionController,
            validator:(value) {
              if (value!.isEmpty) {
                return 'حقل الاسم مطلوب';
              } else {
                return null;
              }
            },
            textInputType: TextInputType.text,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: accountInformation,
                onChanged: (value) {

                  accountInformation = value ?? false;

                },
              ),
              Text( 'استخدم نفس بيانات الحساب',style:  TextStyle(
                color: Colors.black,

                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',


              ),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ConditionalBuilder(
              condition:true,

              builder: (context) =>DefaultButton(text: 'تأكيد',function: (){
                if (keyForm.currentState!.validate()) {

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
  }
}
