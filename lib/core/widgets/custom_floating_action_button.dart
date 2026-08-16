
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_text_style.dart';

import '../../../../core/theming/app_colors.dart';


class CustomFloatingActionButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final void Function()? onPressed;
  const CustomFloatingActionButton({super.key, this.title, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.blue,
              ),
              margin: EdgeInsetsDirectional.only(
                start: 24.w,
                end: 24.w,
                bottom: 5.h,
              ),
              width: double.infinity,
              height: 45.h,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: AppColors.blue,
                onPressed: onPressed ,
                child: child ?? Text(
                  title ?? '',
                  style: AppTextStyle.font16White600,
                ),
              ),
            );
  }
}