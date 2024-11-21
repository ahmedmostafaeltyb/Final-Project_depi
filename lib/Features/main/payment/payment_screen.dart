import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/payment/widget/payment_error_screen.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/sharde/widget/default_button.dart';
import '../../../core/sharde/widget/navigation.dart';



import 'package:flutter/cupertino.dart';


import 'package:myfatoorah_flutter/MFEnums.dart';
import 'package:myfatoorah_flutter/MFModels.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

import '../../../core/sharde/widget/text_forn_field.dart';
import 'manager/payment_cubit.dart';
import 'manager/payment_state.dart';
const String testAPIKey =
    "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";

class PaymentScreen extends StatelessWidget {
  dynamic donation_id;
  dynamic price;
  var keyForm=GlobalKey<FormState>();
  var priceController = TextEditingController();
   PaymentScreen({super.key,this.price,this.donation_id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PaymentViewCubit()..initPayment(),


      child: BlocConsumer<PaymentViewCubit,PaymentViewState>(
        listener:(context,state){},
        builder: (context,state){
          return   Scaffold(

            backgroundColor: Color(0xffF4F6FE),
            appBar: AppBar(
              backgroundColor: Color(0xffF4F6FE),

              leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
                navigapop(context);
              },)
              ,

              title:  Text('اختر طريقه الدفع المناسبه',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
              centerTitle: true,),
            body: Column(
              children: [
                20.verticalSpace,
                SizedBox(
                  height: 120.h,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: BlocProvider.of<PaymentViewCubit>(context).paymentMethods.length,
                      itemBuilder: (context, index) {
                        final cubit = BlocProvider.of<PaymentViewCubit>(context);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                               cubit.changSelectedIndex(index: index);
                               cubit.changPaymentMethode(PaymentMethode: cubit.paymentMethods[index].paymentMethodId!);
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  width: 70.w,
                                  height: 70.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Container(
                                      padding:EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: Color(0xffF4F6FE),
                                      ),
                                      child: Image.network('${cubit.paymentMethods[index].imageUrl}'),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:(cubit.selectedIndex == index)
                                        ? Color(0xff22AAE4)
                                        : Color(0xffF4F6FE),
                                  ),
                                ),
5.verticalSpace,

                                // Text(
                                //   cubit.paymentMethods[index].paymentMethodEn.toString(),
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 15.sp,
                                //     fontFamily: 'Tajawal',
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                40.verticalSpace,
                if(price==null)
                Form(
                  key: keyForm,
                  child: CustomTextFormField(
                    hintText: 'ادخل المبلغ الذى تريد التبرع به',
                    controller: priceController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى ادخال المبلغ';
                      } else {
                        return null;
                      }
                    },
                    textInputType: TextInputType.number,
                  ),
                ),

                                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  DefaultButton(text: 'مساعده هذه الحاله',function: () async {
      if(price==null)
  {
   price=priceController.text;
  }
else
  {
    price=price;
  }




                        var request = MFExecutePaymentRequest(
                            paymentMethodId: BlocProvider.of<PaymentViewCubit>(context).paymentMethode,
                            invoiceValue: int.parse(price));
                        request.displayCurrencyIso = 'EGP';
                        await MFSDK.executePayment(
                            request, MFLanguage.ARABIC, (invoiceId) {
                          log(invoiceId);
                        }).then((value) {
                          BlocProvider.of<PaymentViewCubit>(context).AddPayment(donation_id:donation_id,price: price);


                        }).catchError((error) => {
                          log(error.message),
navigato(context, PaymentErrorScreen())
                        });

                  },),
                ),
              ],
            ),
          );
        },



      ),
    );
  }
}


