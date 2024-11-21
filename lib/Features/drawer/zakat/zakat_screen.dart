import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/drawer/zakat/zakat_cubit/zakat_cubit.dart';
import 'package:gaith/Features/drawer/zakat/zakat_cubit/zakat_state.dart';
import 'package:gaith/core/sharde/app_assets.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../core/sharde/widget/default_button.dart';
import '../../../core/sharde/widget/navigation.dart';
import '../../../core/sharde/widget/text_forn_field.dart';
import '../../main/payment/payment_screen.dart';
List<Map<String,dynamic>> d=[{
  'name':"مال",
  'image':AppAssets.money,

},

  {
    'name':"دهب",
    'image':AppAssets.gold,

  },
  {
    'name':"فضه",
    'image':AppAssets.salver,

  },
];

class ZakatScreen extends StatelessWidget {
  ZakatScreen({Key? key}) : super(key: key);
  var amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F6FE),
      appBar: AppBar(


        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
          navigapop(context);
        },)
        ,

        title:  Text('احسب زكاتك',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
        centerTitle: true,),
      body: BlocProvider(
        create: (context) => ZakatViewCubit(),
        child: BlocBuilder<ZakatViewCubit, ZakatState>(
          builder: (context, state) {
            return Column(
              children: [

                20.verticalSpace,
                SizedBox(
                  height: 100.h,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final cubit = BlocProvider.of<ZakatViewCubit>(context);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              cubit.changSelectedIndex(index: index);
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  width: 70.w,
                                  height: 70.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(d[index]['image']),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: (cubit.selectedIndex == index)
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                                5.verticalSpace,
                                Text(
                                  d[index]['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    fontFamily: 'Tajawal',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                20.verticalSpace,
                if (BlocProvider.of<ZakatViewCubit>(context).selectedIndex == 0)
                  ZakatAlMaal(),




               if (BlocProvider.of<ZakatViewCubit>(context).selectedIndex == 1||BlocProvider.of<ZakatViewCubit>(context).selectedIndex ==2)
                 ZakatOfGold()
              ],
            );
          },
        ),
      ),
    );
  }
}

class ZakatAlMaal extends StatelessWidget {
  ZakatAlMaal({super.key});

  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المبلغ المراد حسابه',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',
            ),
          ),
          5.verticalSpace,
          CustomTextFormField(
            hintText: 'ادخل المبلغ',

            controller: amountController,
            textInputType: const TextInputType.numberWithOptions(signed: false),),

              20.verticalSpace,

          Column(
            children: [

              DefaultButton(text:'احسب الان ', function: (){
                BlocProvider.of<ZakatViewCubit>(context).ClcZakatAlMaa(Amount: num.parse(amountController.text));
              }),
              10.verticalSpace,
              Row(
                children: [

                  Text(
                    'زكاتك المستحقه بالجنيه المصرى ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  5.horizontalSpace,
                  Expanded(flex: 2,child: Text('${BlocProvider.of<ZakatViewCubit>(context).AmountZakat}')),
                ],
              ),

40.verticalSpace,
              if(BlocProvider.of<ZakatViewCubit>(context).AmountZakat!=null&&BlocProvider.of<ZakatViewCubit>(context).AmountZakat>0)
                DefaultButton(text:'تبرع بمقدار زكاتك ', function: (){
                  navigato(context, PaymentScreen(donation_id:2 ,price:BlocProvider.of<ZakatViewCubit>(context).AmountZakat ,));
                }),
            ],
          )


        ],
      ),
    );
  }
}

class ZakatOfGold extends StatelessWidget {
  ZakatOfGold({super.key});

  var numberOfGramController = TextEditingController();

  var amountGramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الوزن (بالجرم)',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',
            ),
          ),
          5.verticalSpace,
          CustomTextFormField(
            hintText: 'ادخل الوزن المراد حسابه',
            controller: numberOfGramController,
            textInputType: const TextInputType.numberWithOptions(signed: false),
          ),
          Text(
            'السعر/ جرام واحد (بالجنيه)',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',
            ),
          ),
          5.verticalSpace,
          CustomTextFormField(
            hintText: 'ادخل سعر الجرام الواحد',
            controller: amountGramController,
            textInputType: const TextInputType.numberWithOptions(signed: false),
          ),
      20.verticalSpace,

          Column(
            children: [
              DefaultButton(text:'احسب الان ', function: (){
                BlocProvider.of<ZakatViewCubit>(context).ClcZakatGoald(amountGram:num.parse(amountGramController.text) ,numberOfGram: num.parse(numberOfGramController.text));
              }),
              20.verticalSpace,
              Row(
                children: [


                  Text(
                    'زكاتك المستحقه بالجنيه المصرى ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      fontFamily: 'Tajawal',
                    ),
                  ),

                  Expanded(flex: 2,child: Text(BlocProvider.of<ZakatViewCubit>(context).AmountGoald!=null?'${BlocProvider.of<ZakatViewCubit>(context).AmountGoald}':'0',)),
                ],
              ),
40.verticalSpace,
             if(BlocProvider.of<ZakatViewCubit>(context).AmountGoald!=null&&BlocProvider.of<ZakatViewCubit>(context).AmountGoald!>0)
              DefaultButton(text:'تبرع بمقدار زكاتك ', function: (){
                navigato(context, PaymentScreen(donation_id:2 ,price:BlocProvider.of<ZakatViewCubit>(context).AmountGoald ,));
              }),
            ],
          )


        ],
      ),
    );
  }
}


