import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharde/app_assets.dart';
import '../model/volunteer_model.dart';
import 'detalise_card.dart';

class CardViewVolunter extends StatelessWidget {
  Volunteers volunteers;

  CardViewVolunter({super.key, required this.volunteers});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
              height: MediaQuery.of(context).size.width * .4,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.sp),
                    topRight: Radius.circular(5.sp),
                  ),
                  child: (volunteers.img
                      ==
                      null)
                      ? CircularProgressIndicator(
                    value: 0.7,
                  )
                      : Image.network(
                    '${volunteers.img}',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ))),
          DetaliseCard(
            volunteerModel: volunteers,
          )
        ],
      ),
    );
  }
}
