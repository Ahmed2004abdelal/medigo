import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../data/social_media_model.dart';

import '../../../../../core/theming/app_text_style.dart';


class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(socialMediaList.length, ((index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: 156.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: AppColors.lightGrey, width: 1.5.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  socialMediaList[index].image!,
                  width: 20.w,
                  height: 20.h,
                ),
                horizontalSpace(10),
                Text(
                  socialMediaList[index].name!,
                  style: AppTextStyle.font14Black500,
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}

