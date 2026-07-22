import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../data/models/speciality_model.dart';

class SpecialtiesList extends StatelessWidget {
  const SpecialtiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialityItems.length,
        itemExtent: 80.w,
        itemBuilder: ((context, index) {
          final item = specialityItems[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: SvgPicture.asset(item.image),
              ),
              verticalSpace(5),
              SizedBox(
                width: 59.w,
                child: Text(
                  item.title,
                  style: AppTextStyle.font10Grey1400,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}