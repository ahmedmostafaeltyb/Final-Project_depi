import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../onBordingScreesn.dart';
class SmoothPageIndicatorOnBording extends StatelessWidget {
  const SmoothPageIndicatorOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: bordcontroll,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: const WormEffect(
          spacing: 8.0,
          radius: 10.0,
          dotWidth: 40.0,
          dotHeight: 5.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          activeDotColor: Color(0xff22AAE4)),
    );
  }
}
