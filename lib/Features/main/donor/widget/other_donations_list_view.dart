import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';
import '../../../../core/sharde/app_assets.dart';
import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/text_forn_field.dart';
import '../../home/feature/manager/home_cubite.dart';

import '../cubit/home_view_cubit.dart';
import '../cubit/home_view_state.dart';
class OtherDonationsListView extends StatelessWidget {
  OtherDonationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<DonorViewCubit, DonorViewState>(

      listener: (context,state)
      {


      },
      builder:(context,state){

        return
        (BlocProvider.of<DonorViewCubit>(context).donorModel ==null)?
        SizedBox(
          height: 100.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder:(context,index)=> InkWell(
                onTap: (){
                  // navigato(context,  DonationDetails());
                },
                child: Column(
                  children: [

                    Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Material(


                          elevation:1.0,
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                          ),

                        ),

                    ),




                  ],
                ),
              ),
              separatorBuilder: (context,index)=>SizedBox(width: 5.w,),
              itemCount: 20

          ),
        )
            :
          SizedBox(
          height: 100.h,

          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder:(context,index)=> InkWell(
                onTap: (){
                  navigato(context,  DonationDetails(index: index,));
                },
                child: Column(
                  children: [
                    Material(

                      color: Colors.white,
                      elevation:1.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          '${BlocProvider.of<DonorViewCubit>(context).donorModel!.catigory![index].img}',
                          height: 50.h,
                          width: 50.h,
                        ),
                      ),
                    ),
                    5.verticalSpace,

                    Text('${BlocProvider.of<DonorViewCubit>(context).donorModel!.catigory![index].nameAr}',style:  TextStyle(
                      color: Colors.black,


                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      fontFamily: 'Tajawal',


                    ),
                      maxLines: 2,
                  )
                  ],
                ),
              ),
              separatorBuilder: (context,index)=>SizedBox(width: 5.w,),
              itemCount: BlocProvider.of<DonorViewCubit>(context).donorModel!.catigory!.length

          ),
        );

      },

    );
  }
}

List<Map<String,dynamic>>DonationDetailslist=[
  {
    'image':AppAssets.colthes,
    'text':'ملابس',
    'dec_text':'تبرع بالملابس اليوم وساهم في إضفاء الدفء والراحة على حياة شخص محتاج.'
  },
  {
    'image':AppAssets.health,
    'text':'صحه',
    'dec_text':'مساعدات الأدوية تصل إلى المرضى بشكل دائم وثابت شهريًا، وذلك تأكيدًا لأهمية الجهود التطوعية وتبرع الأفراد بالأدوية الزائدة على حاجاتهم'
  }, {
    'image':AppAssets.food,
    'text':'طعام',
    'dec_text':'أن خير الناس من يقوم بإطعام الطعام: قال رسول الله صلى الله عليه وسلم: «خِيَارُكُمْ مَنْ أَطْعَمَ الطَّعَامَ'
  }, {
    'image':AppAssets.garmin,
    'text':'غارمين',
    'dec_text':'شارك معانا دلوقتى عشان نقدر نفك كرب كل غارم وغارمة ويرجعوا لحضن أولادهم'
  }, {
    'image':AppAssets.develo,
    'text':'تنميه',
    'dec_text':'تبرعك ليس مجرد مساهمة مالية ، بل هو بذرة لتغيير العالم'
  },
  {
    'image':AppAssets.disabled,
    'text':'ذوى الهمم',
    'dec_text':'مدوا يد العون وابنوا جسور الأمل والتضامن'
  },


];

class DonationDetails extends StatelessWidget {
final  int index;

   DonationDetails({super.key,required this.index});
   var nameController=TextEditingController();
   var phoneController=TextEditingController();
   var addressController=TextEditingController();
   var descriptionController=TextEditingController();
   var keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (context) => DonorViewCubit(),

        child: BlocConsumer<DonorViewCubit, DonorViewState>(
          listener: (context, state) {


            if (state is AddDonationStateSuccess) {
              print('GAmmmm');
              print(state.successModel!.status);
              print(state.successModel!.status.runtimeType);
              print('ddddddddddddddd');
              if(state.successModel!.status==1){

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: Colors.white,

                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppAssets.success),

                        Text('${state.successModel!.message}',  style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Ottoman',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('شكر على تبرعك معانا ',  style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Ottoman',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('سيتم ارسال مندوب لك للاستلام تبرعك', style: TextStyle(
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
              if(state.successModel!.status!=1)
              {

                Fluttertoast.showToast(
                    msg: '${state.successModel!.message}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }

            }

            if(state is AddDonationStateError)
              {
                ScaffoldMessenger.of(context).showSnackBar(

                  SnackBar(backgroundColor: Colors.red,content: Text('لم يتم تنفيذ التبرع حاول مره اخرى وتاكد من الانترنت')),
                );
              }



          },
          builder: (context, state){
            return Scaffold(
              backgroundColor: Color(0xffF8FFFF),
              resizeToAvoidBottomInset: true,
              body:
              SafeArea(
                child:  

                Form(
                  key:keyForm ,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,

                          children: [
                            Image.asset( DonationDetailslist[index]['image'],width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                            Positioned(

                                bottom: -30,
                                left: 8,
                                right: 8,
                                child:
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xff22AAE4),
                                      width: 1,
                                    ),

                                  ),
                                  padding: const EdgeInsets.all(5),


                                  child:  Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(DonationDetailslist[index]['text'], style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,

                                        fontFamily: 'Tajawal',
                                      ),),
                                      Text(DonationDetailslist[index]['dec_text'],style: TextStyle(  fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff555555),

                                        fontFamily: 'Tajawal',),),

                                    ],
                                  ),
                                )),
                            IconButton(onPressed: (){navigapop(context);}, icon: Icon(Icons.arrow_back_ios))


                          ],
                        ),

                        SizedBox(height: 50.h,),
                        if(BlocProvider.of<DonorViewCubit>(context).addDonationPhoto!=null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0), // تعديل نسبة القطع حسب الحاجة
                                child: Image.file(
                                  File(BlocProvider.of<DonorViewCubit>(context).addDonationPhoto!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        CustomTextFormField(hintText: 'الإسم',
                          controller:nameController,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return 'حقل الاسم مطلوب';
                            } else {
                              return null;
                            }
                          },
                          textInputType: TextInputType.visiblePassword,),
                        CustomTextFormField(hintText: 'رقم الموبيل',
                          controller:phoneController,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return 'حقل الموبيل مطلوب';
                            } else {
                              return null;
                            }
                          },
                          textInputType: TextInputType.phone,),
                        CustomTextFormField(hintText: 'العنوان',
                          controller:addressController,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return 'حقل العنوان مطلوب';
                            } else {
                              return null;
                            }
                          },
                          textInputType: TextInputType.streetAddress,),
                        CustomTextFormField(hintText: 'تفاصيل التبرع',
                          controller:descriptionController,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return 'هذا الحقل  مطلوب';
                            } else {
                              return null;
                            }
                          },
                          textInputType: TextInputType.text,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(onTap:(){

                              BlocProvider.of<DonorViewCubit>(context).getProfileImageByCamera();
                            } ,child: Icon(Icons.camera_alt,color: Color(0xff529C9C),)),
                            InkWell(onTap:(){

                              BlocProvider.of<DonorViewCubit>(context).getProfileImageByGallery();
                            } ,child: Image.asset(AppAssets.Attachphoto)),


                          ],
                        ),

                      SizedBox(height: 20.h),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ConditionalBuilder(
                            condition: !(BlocProvider.of<DonorViewCubit>(context).state
                            is AddDonationStateLoading),
                            builder: (context) => DefaultButton(
                              text: 'تبرع',
                              function: () {
                                if (keyForm.currentState!.validate()) {
                                  BlocProvider.of<DonorViewCubit>(context).AddDonation(
                                    image: BlocProvider.of<DonorViewCubit>(context).addDonationPhoto,
                                    context: context,
                                 address: addressController.text,
                                    name: nameController.text,
                                    catigory_id: '14',
                                    des: descriptionController.text,
                                    phone: phoneController.text


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


                      ],
                    ),
                  ),
                ),



              ),
            );
          },



        ),
      );
  }
}
