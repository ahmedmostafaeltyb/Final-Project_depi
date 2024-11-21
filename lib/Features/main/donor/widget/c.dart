

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomNavigationItem extends StatelessWidget {

  final bool isSelected;
  final String label;
  final Function() onTap;

  const BottomNavigationItem({
    Key? key,

    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: InkWell(
        onTap: () {
          if (isSelected) {
            return;
          }
          onTap();
        },
        child:  Container(

      padding: EdgeInsets.all(3),
          width: 100.w,
          height: 40.h,
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
            color: isSelected ? Color(0xff22AAE4) : Colors.white,
          ),
          child:
        Center(
          child: Center(
            child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: isSelected ? Colors.white : Colors.black,
                      fontFamily: 'Tajawal',

                      // letterSpacing: -0.5,
                    ),
                  ),
          ),
        ),
        )



      ),
    );
  }
}