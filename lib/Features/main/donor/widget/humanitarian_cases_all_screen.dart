import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/donor/cubit/home_view_cubit.dart';
import 'package:gaith/Features/main/donor/cubit/home_view_state.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/navigation.dart';
import '../donation_status_details.dart';
import 'c.dart';
List<String>categoryList=
[
  'الكل', 'ملابس','صحه','طعام','غارمين','التنميه','ذوى الاحتياجات الخاصه',

];
class HumanitarianCasesAllScreen extends StatelessWidget {
  const HumanitarianCasesAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F6FE),
        appBar: AppBar(


        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
          navigapop(context);
        },)
        ,

        title:  Text('الحالات الانسانيه',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
        centerTitle: true,),
        body: BlocProvider(
          create: (context) => DonorViewCubit()..getHomeData()..getDonationsByCategory(
              categoryId:
              0),
          child: BlocConsumer<DonorViewCubit, DonorViewState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        height: 40.h,
                        child: (BlocProvider.of<DonorViewCubit>(context)
                                    .donorModel ==
                                null)
                            ? Container(
                                padding: EdgeInsets.all(10),
                                child: Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )),
                              )
                            :
                        ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                itemCount:
                                    BlocProvider.of<DonorViewCubit>(context)
                                        .donorModel!
                                        .catigory!
                                        .length,
                                itemBuilder: (context, index) {
                                  return BottomNavigationItem(
                                    onTap: () {
                                      BlocProvider.of<DonorViewCubit>(context)
                                          .changeBottomItem(index: index);
                                      if(index==0)
                                      {
                                        BlocProvider.of<DonorViewCubit>(context)
                                            .getDonationsByCategory(
                                            categoryId:0);

                                      }
                                      else
                                        {
                                          BlocProvider.of<DonorViewCubit>(context)
                                              .getDonationsByCategory(
                                              categoryId:
                                              BlocProvider.of<DonorViewCubit>(
                                                  context)
                                                  .donorModel!
                                                  .catigory![index-1]
                                                  .id);
                                        }


                                    },
                                    label:
                                    categoryList[index],
                                    isSelected: index ==
                                        BlocProvider.of<DonorViewCubit>(context)
                                            .currentItem,
                                  );
                                },
                              ),
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.loose,
                      child: BlocProvider.of<DonorViewCubit>(context)
                                  .donorByCategoryIdModel ==
                              null
                          ?
                      Container(
                              padding: EdgeInsets.all(10),
                              child: Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child:
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .16,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(
                                                            10.sp),
                                                    topRight: Radius.circular(
                                                        10.sp),
                                                  ),

                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 4),


                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount:
                                        10,
                                  )),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item =
                                    BlocProvider.of<DonorViewCubit>(context)
                                        .donorByCategoryIdModel!
                                        .donations![index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: InkWell(
                                    onTap: () {
                                      navigato(
                                          context,
                                          DonationStatusDetails(
                                            id: item.id ?? 1,
                                          ));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .16,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.sp),

                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10.sp),
                                                topRight:
                                                    Radius.circular(10.sp),
                                              ),
                                              child:
                                                  Image.network('${item.img}',height: MediaQuery.of(context).size.height,fit: BoxFit.fitHeight,),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    item.name.toString(),

                                                        style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 13.sp,color: Colors.black,fontWeight: FontWeight.w700))
                                                  ),
                                                  Text(
                                                    '${item.dec}',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14.sp,color: Color(0xff555555),fontWeight: FontWeight.w400)
                                                  ),)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                                  BlocProvider.of<DonorViewCubit>(context)
                                      .donorByCategoryIdModel!
                                      .donations!
                                      .length,
                            ),
                    ),
                  ],
                );
              }),
        ));
  }
}
