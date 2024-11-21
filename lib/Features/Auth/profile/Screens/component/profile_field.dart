import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/Auth/profile/Screens/component/profile_view_body_information_itrm.dart';
import 'package:gaith/Features/Auth/profile/Screens/component/update_profile_view_body.dart';

import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/sharde/chacheHelper.dart';
import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/styles.dart';
import '../../Controller/profile_view_cubit.dart';
import '../../Controller/profile_view_state.dart';


class ProfileField extends StatelessWidget {
  const ProfileField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileViewCubit()..getDataProfile(),
      child: BlocConsumer<ProfileViewCubit, ProfileViewState>(
        listener: (context, state)
        {},
        builder: (context,state){
          var model=BlocProvider.of<ProfileViewCubit>(context).profileModel;
          return ConditionalBuilder(
             condition: model !=null,
             builder: (context)=>   Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Column(

                     children: [

                       Container(
                         padding: EdgeInsets.all(2),
                         decoration: BoxDecoration(

                           borderRadius: BorderRadius.circular(50.sp),
                           color:  Color(0xff22AAE4)

                         ),
                    

                         child: CircleAvatar(
                           backgroundImage:  NetworkImage('${model!.user!.img}'),
                           radius: 50.0.sp
                         ),
                       ),
                       const SizedBox(height: 6.0,),
                       Text('${model.user!.name}',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
                         ProfileViewBodyInformationItem(labelText: 'الاسم',text: '${model.user!.name}',),
                       const SizedBox(height:10 ,),
                       ProfileViewBodyInformationItem(labelText: 'البريد الالكترونى',text: '${model.user!.email}',),
                       const SizedBox(height:10 ,),
                       ProfileViewBodyInformationItem(labelText: 'رقم الموبيل',text: '${model.user!.phone}',),
                       const SizedBox(height:10 ,),
                       ProfileViewBodyInformationItem(labelText: 'العنوان',text: '${model.user!.address}',),
                       const SizedBox(height:20 ,),
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: DefaultButton(text: 'تعديل الملف الشخصى',function: (){
                                  navigato(context, UpdateProfileViewBody(updateProfileModel: model,));

                                     }
                         ),)


                     ],
                   ),






                 )
               ],
             ),
              fallback: (context) => const Center(child: CircularProgressIndicator(
                strokeWidth: 5.0,
                backgroundColor: Colors.black,
                color: Colors.blue,
                strokeAlign: 7,
                semanticsLabel: 'Linear progress indicator',

              )));

        },
        ),


    );
  }
}

























