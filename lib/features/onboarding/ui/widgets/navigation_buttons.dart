import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/core/helpers/extension.dart';
import 'package:medigo/core/routing/routes.dart';
import 'package:medigo/features/onboarding/data/onboarding_model.dart';
import 'package:medigo/features/onboarding/logic/cubit/onboarding_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_style.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({
    super.key,
    required this.isFirst,
    required this.cubit,
    required this.isLast,
  });

  final bool isFirst;
  final OnboardingCubit cubit;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isFirst
            ? SizedBox.shrink()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                    side: BorderSide(
                      width: 2.0.w,
                      color: AppColors.britnessBlue,
                    ),
                  ),
                  backgroundColor: AppColors.babyBlue,
                  minimumSize: Size(155.w, 40.h),
                ),
                onPressed: () {
                  cubit.previousPage();
                },
                child: Text(
                  'Previous',
                  style: AppTextStyle.font16BritnessBlue600,
                ),
              ),
        isFirst ? SizedBox.shrink() : horizontalSpace(16.w),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.britnessBlue,
            minimumSize: Size(isFirst ? 331.w : 155.w, 40.h),
          ),
          onPressed: () {
            isLast ? context.pushNamedAndRemoveUntil(Routes.login, predicate: (routes)=> false) : cubit.nextPage(onboardingItems.length);
          },
          child: Text(
            isLast ? 'Get Started' : 'Next',
            style: AppTextStyle.font16White600,
          ),
        ),
      ],
    );
  }
}