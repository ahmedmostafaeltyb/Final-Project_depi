import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/Volunteer/widget/card_view_volunter.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:gaith/core/sharde/widget/styles.dart';

import '../../../core/sharde/widget/default_button.dart';
import '../../../core/sharde/widget/navigation.dart';
import 'cubit/volunteer_view_cubit.dart';
import 'cubit/volunteer_view_state.dart';

class VolunteerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VolunteerViewCubit()..getVolunteerData(),
        child: BlocConsumer<VolunteerViewCubit, VolunteerViewState>(
          listener: (context, state){},
            builder: (context, state) {
              return Container(
                color: Color(0xffF4F6FE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ConditionalBuilder(
                        condition: BlocProvider.of<VolunteerViewCubit>(context)
                                .volunteerModel !=
                            null,
                        builder: (context) {
                          return Expanded(
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: CardViewVolunter(
                                        volunteers:
                                            BlocProvider.of<VolunteerViewCubit>(
                                                    context)
                                                .volunteerModel!
                                                .volunteers![index],
                                      ),
                                    ),

                                separatorBuilder: (context, index) => SizedBox(
                                  height: 5.h,
                                ),
                                itemCount:
                                    BlocProvider.of<VolunteerViewCubit>(context)
                                        .volunteerModel!
                                        .volunteers!
                                        .length),
                          );
                        },
                        fallback: (context) {
                          return CircleAvatar();
                        }),
                  ],
                ),
              );
            }));
  }
}
