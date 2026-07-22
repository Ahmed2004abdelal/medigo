import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/core/helpers/extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../data/models/avilable_doctors_model.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(Routes.doctorDetails, arguments: doctor);
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(
                start: index == 0 ? 0.w : 10.w,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  SizedBox(
                    height: 135.h,
                    width: 130.w,

                    child: Image.asset(
                      doctor.image,
                      height: 135.h,
                      width: 129.w,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45.withAlpha(120),
                      ),

                      height: 44.h,
                      width: 129.w,
                      padding: EdgeInsetsDirectional.only(
                        start: 13.w,
                        top: 5.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doctor.name, style: AppTextStyle.font13White600),
                          Text(
                            doctor.specialties,
                            style: AppTextStyle.font11LighterBlue400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
