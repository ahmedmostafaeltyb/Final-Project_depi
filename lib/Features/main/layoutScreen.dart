import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:gaith/Features/main/payment/payment_screen.dart';
import 'package:gaith/Features/main/payment/widget/payment_error_screen.dart';
import 'package:gaith/Features/main/payment/widget/payment_scuccess_screen.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/sharde/widget/log_out.dart';
import '../../core/sharde/widget/navigation.dart';

import '../Auth/profile/Screens/profile_view.dart';

import '../drawer/cart/cart_screen.dart';
import '../drawer/zakat/zakat_screen.dart';
import 'home/feature/manager/home_cubite.dart';
import 'home/feature/manager/home_view__state.dart';


class LayoutScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit()..getProfile(),
      child: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'غيث',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Ottoman',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.access_time_sharp),
                    onPressed: () {
                      navigato(context, PaymentScuccessScreen());
                    },
                  ),
                ],
                leading: IconButton(
                  icon: Icon(Icons.menu_open_sharp),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
              ),
              drawer:
                  BlocProvider.of<HomeViewCubit>(context).profileModel == null
                      ? Container()
                      :
                  Drawer(
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                         DrawerHeader(
                          decoration: BoxDecoration(
                            color: Color(0xFF22AAE4),
                          ), // BoxDecoration
                          child:Image.asset(AppAssets.logo)
                          // UserAccountDrawerHeader
                        ), // DrawerHeader
                        ListTile(
                          leading: const Icon(Icons.person, color: Color(0xFF22AAE4)),
                          title: const Text(
                            'الملف الشخصى',
                            style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                          onTap: () {
                            navigato(context, ProfileView());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.closed_caption, color: Color(0xFF22AAE4)),
                          title: Text(
                            'احسب زكاتك',
                            style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                          onTap: () {
                            navigato(context, ZakatScreen());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.add_shopping_cart, color: Color(0xFF22AAE4)),
                          title: Text(
                            'السله',
                            style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                          onTap: () {
                            navigato(context, CartScreen());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.edit, color: Color(0xFF22AAE4)),
                          title: Text(
                            'تعديل الملف الشخصى',
                            style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                          onTap: () {
                            navigato(context, PaymentScreen());

                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.logout,
                            color: Color(0xFF22AAE4),
                          ),
                          title: Text(
                            'تسجيل خروج',
                            style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'تسجيل الخروج',
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff2B2B2B),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.network(
                                        'https://www.example.com/your-image-url.png',
                                        height: 100,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'هل أنت متأكد أنك تريد تسجيل الخروج؟',
                                        style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff2B2B2B),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        'إلغاء',
                                        style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff2B2B2B),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        'تسجيل الخروج',
                                        style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff22AAE4),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        SingOut(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
              bottomNavigationBar: SalomonBottomBar(
                curve: Curves.easeOutQuint,
                currentIndex:
                    BlocProvider.of<HomeViewCubit>(context).CurrentIndex,
                onTap: (index) {
                  BlocProvider.of<HomeViewCubit>(context)
                      .Changecurrentindex(index);
                },
                items: [
                  SalomonBottomBarItem(
                    icon: Icon(FeatherIcons.home),
                    title: const Text("الصفحه الرئسيه"),
                    selectedColor: Color(0xff22AAE4),
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(FeatherIcons.anchor),
                    title: Text("المحتاجين"),
                    selectedColor: Color(0xff22AAE4),
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text("السله"),
                    selectedColor: Color(0xff22AAE4),
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.volunteer_activism),
                    title: Text("التطوع"),
                    selectedColor: Color(0xff22AAE4),
                  ),
                ],
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    BlocProvider.of<HomeViewCubit>(context).Scrreen[
                        BlocProvider.of<HomeViewCubit>(context).CurrentIndex],
                  ],
                ),
              ));
        },
      ),
    );
  }
}
