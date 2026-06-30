import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/core/theming/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final TextStyle font20White700 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static final TextStyle font22Black600 = TextStyle(
    fontSize: 22.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static final TextStyle font14Grey1400 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static final TextStyle font16White600 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static final TextStyle font16BritnessBlue600 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.britnessBlue,
  );
}
