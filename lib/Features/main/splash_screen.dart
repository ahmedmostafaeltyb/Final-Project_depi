import 'package:flutter/material.dart';

import '../../core/sharde/widget/navigation.dart';
import 'on_bording/view/onBordingScreesn.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:3 ),(){
      navigatofinsh(context,  OnBordingScreen(), false);

    },);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.png'),
            fit: BoxFit.cover,
          ),
        ),

      ),
    );
  }
}
