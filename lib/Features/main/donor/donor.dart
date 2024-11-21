// import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gaith/Features/main/donor/widget/component_casses_in_home.dart';
import 'package:gaith/Features/main/donor/widget/component_shares_in_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/donor/widget/humanitarian_cases_all_screen.dart';
import 'package:gaith/Features/main/donor/widget/other_donations_list_view.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/sharde/app_assets.dart';
import '../../../core/sharde/app_colors.dart';
import '../../../core/sharde/widget/default_button.dart';
import 'cubit/home_view_cubit.dart';
import 'cubit/home_view_state.dart';
import 'donation_status_details.dart';
import 'model/home_model.dart';
import 'model/shares_model.dart';
class DonorPage extends StatelessWidget {
  const DonorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (context) => DonorViewCubit()..getHomeData()..getSharesData(),

      child: BlocConsumer<DonorViewCubit, DonorViewState>(
        listener: (context,state)
        {},
        builder:(context,state)
          {

            return
              Container(
              width: MediaQuery.of(context).size.width,

                  color:Color(0xffF4F6FE),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [




                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AppAssets.banar1,),


                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),

                          ),
                        ),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade800,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                        Marquee(

                          text:' مع ابليكشن غيث تبرعك سوف يصل الى كل محتاج تبرع الان ',

                          style: TextStyle(fontSize: 16.0.sp,fontFamily: 'Ottoman', color: Colors.white,fontWeight: FontWeight.w400),


                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: 100.0,
                          pauseAfterRound: Duration(milliseconds: 500),
                          startPadding: 10.0,
                          accelerationDuration: Duration(milliseconds: 500),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    OtherDonationsListView(),






                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:

                      Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  Text('الحالات الانسانيه',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
  InkWell(
    onTap: (){
      navigato(context, HumanitarianCasesAllScreen());
    },
    child: Text('عرض الكل',
      style:  TextStyle(
      color: Color(0xff22AAE4),
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      fontFamily: 'Tajawal',


    ),),
  ),
],

                      ),
                    ),



                    (BlocProvider.of<DonorViewCubit>(context).donorModel ==null)?
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 320.h,
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child:Container( width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(10),
                                            
                          ),)
                                            
                      ),
                    ):
                    SizedBox(
                        height: 280.h,

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context,index){
                            return

                              ComponentCassesInHome(index: index,modelCasesInHome:BlocProvider.of<DonorViewCubit>(context).donorModel!);



                          }
                          , itemCount: BlocProvider.of<DonorViewCubit>(context).donorModel!.donations!.length,),
                      ),

                    10.verticalSpace,
                    (BlocProvider.of<DonorViewCubit>(context).donorModel==null)?
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 150.h,
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child:Container( width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(10),

                          ),)

                      ),
                    ):

                    SizedBox(
                      height: 150.0.h,

                      width: MediaQuery.of(context).size.width,
                      child:
                      CarouselSlider.builder(
                        itemCount: BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements!.length,
                        itemBuilder: (context, index, realIndex) {
                          return
                            (BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements!.length==0)?
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 100.0.h,
                              child:
                              Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child:Container( width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(10),

                                  ),)

                              ),
                            ):
                            ClipRRect
                              (
                              borderRadius: BorderRadius.circular(10),
                              child:
                              (BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements![index].img==null)?
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100.0.h,
                                child: Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child:Container( width: MediaQuery.of(context).size.width,color: Colors.grey.shade50,)

                                ),
                              )
                                  :Image.network(


                                width: MediaQuery.of(context).size.width,
                                '${BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements![index].img}',
                                fit: BoxFit.fill,
                              ),
                            );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
                          onPageChanged: (index, reason) {
                            BlocProvider.of<DonorViewCubit>(context).onPageChanged(index: index);
                          },
                        ),
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        ' ( إِنَّمَا الصَّدَقَاتُ لِلْفُقَرَاءِ وَالْمَسَاكِينِ وَالْعَامِلِينَ عَلَيْهَا وَالْمُؤَلَّفَةِ قُلُوبُهُمْ وَفِي الرِّقَابِ وَالْغَارِمِينَ وَفِي سَبِيلِ اللَّهِ وَابْنِ السَّبِيلِ فَرِيضَةً مِّنَ اللَّهِ ۗ وَاللَّهُ عَلِيمٌ حَكِيمٌ")',
                        style: TextStyle(fontSize: 18.0.sp,fontFamily: 'Ottoman', color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:

                      Text('الاسهم', style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700))),
                    ),

                    SizedBox(
                      height: 320.h,

                      child:

                      (BlocProvider.of<DonorViewCubit>(context).shareModel ==null)?
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 320.h,
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child:Container( width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(10),

                            ),)

                        ),
                      ):

                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context,index){
                          return
                            ComponentSharesInHome(index: index,shareModelInHome:BlocProvider.of<DonorViewCubit>(context).shareModel! ,);
                        }
                        , itemCount: BlocProvider.of<DonorViewCubit>(context).shareModel!.shares!.length,),
                    ),


                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        ' ( الَّذِينَ يُنفِقُونَ فِي السَّرَّاءِ وَالضَّرَّاءِ وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ )',
                        style: TextStyle(fontSize: 18.0.sp,fontFamily: 'Ottoman', color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,

                      ),
                    ),

                  ],
                ),
              )
            );
          }


      ),
    );
  }
}











