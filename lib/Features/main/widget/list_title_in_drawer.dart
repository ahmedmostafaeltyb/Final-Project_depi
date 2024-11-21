import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ListTitleInDrawer extends StatelessWidget {
  IconData icon;
  String text;
   ListTitleInDrawer({super.key,required this.text,required this.icon });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon,color: Colors.orange),
        title: Text(text,
       style:TextStyle(
            color: Colors.black,

            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
            fontFamily: 'Cairo',


          ),

        ),
        onTap: () {

          Navigator.pop(context);

        },
      ),
    );
  }
}
