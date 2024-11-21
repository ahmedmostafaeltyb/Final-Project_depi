import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/drawer/cart/widget/card_cart.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/sharde/widget/navigation.dart';
import '../../main/donor/cubit/home_view_cubit.dart';
import '../../main/donor/cubit/home_view_state.dart';
import '../../main/payment/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F6FE),

      body: BlocProvider(
          create: (context) => DonorViewCubit()..getCartAll(),
          child: BlocConsumer<DonorViewCubit, DonorViewState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Center(
                child: BlocProvider.of<DonorViewCubit>(context).cartModel ==
                        null
                    ? CircularProgressIndicator()
                    : Stack(
                  alignment: Alignment.bottomLeft,
                      children: [
                        ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = BlocProvider.of<DonorViewCubit>(context)
                                  .cartModel!
                                  .carts![index];
                              return Dismissible(
                                key: Key(item.id.toString()),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'حذف',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  setState(() {
                                    BlocProvider.of<DonorViewCubit>(context)
                                        .cartModel!
                                        .carts!
                                        .removeAt(index);
                                  });

                                  BlocProvider.of<DonorViewCubit>(context)
                                      .deleteItemInCart(donationId: item.id!);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('تم الحذف')),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  child: CardCart(
                                    title: item.name,
                                    idDonation: item.id!,
                                    image: item.img!,
                                    price: item.price!,
                                  ),
                                ),
                              );
                            },
                            itemCount: BlocProvider.of<DonorViewCubit>(context)
                                .cartModel!
                                .carts!
                                .length,
                          ),

                        InkWell(
                          onTap: (){

                            navigato(context, PaymentScreen(price: BlocProvider.of<DonorViewCubit>(context).cartModel!.total,));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height:60,
                              decoration: BoxDecoration(
                                  color: Color(0xff22AAE4),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,

                              child: Column(

                                children: [
                                  Text('اجمالى مبلغ السله',
                                    style:  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      fontFamily: 'Tajawal',


                                    ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(' ${BlocProvider.of<DonorViewCubit>(context).cartModel!.total}',
                                        style:  TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'Tajawal',


                                        ),),
                                      Text('تبرع بالمبلغ',
                                        style:  TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'Tajawal',


                                        ),),


                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
              );
            },
          )),
    );
  }
}
