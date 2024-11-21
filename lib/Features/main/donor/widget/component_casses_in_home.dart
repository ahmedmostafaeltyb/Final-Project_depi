
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharde/app_colors.dart';
import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/navigation.dart';
import '../cubit/home_view_cubit.dart';
import '../donation_status_details.dart';
import '../model/home_model.dart';

class ComponentCassesInHome extends StatelessWidget {
  DonorModel modelCasesInHome;
  var index;
  ComponentCassesInHome({required this.modelCasesInHome,required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        print(modelCasesInHome.donations);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: MediaQuery.of(context).size.width*.8,
          decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:MediaQuery.of(context).size.width*.4,child:
              ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(10.sp),
                topRight:Radius.circular(10.sp),
              ),child:(modelCasesInHome.donations![index].img==null)?
              CircularProgressIndicator(
                value: 0.7,
              ):
              Image.network('${modelCasesInHome.donations![index].img}',width: double.infinity,fit: BoxFit.cover,))),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${modelCasesInHome.donations![index].name}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Tajawal',
                            color: Color(0xff095372)
                        ),
                      ),
                      Text(
                        maxLines: 2,

                        '${modelCasesInHome.donations![index].dec}',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          color: Color(0xff555555),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex:3,
                            child: DefaultButton(function: (){
                              final donation = modelCasesInHome;
                              navigato(context, DonationStatusDetails(id: modelCasesInHome.donations![index].id!));
                            },text: 'تبرع',),
                          ),

                          2.horizontalSpace,
                          Expanded(
                              flex: 1,
                              child:  Container(
                                decoration: BoxDecoration(
                                  color:  Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                width: double.infinity,
                                height: 40.h,

                                child: MaterialButton(
                                    onPressed:(){

                                       BlocProvider.of<DonorViewCubit>(context).addCart(donationId: modelCasesInHome.donations![index].id! );
                                    },
                                    child:
                                    Icon(Icons.add_shopping_cart, color: Color(0xff22AAE4),size: 25,)

                                ),
                              )
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
      ),
    );
  }
}