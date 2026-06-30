import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/features/onboarding/data/onboarding_model.dart';

import '../../../../core/theming/app_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  final int index;
  const OnboardingIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingItems.length,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: i == index ? 44.w : 10.w,
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: i == index ? AppColors.blue : AppColors.babyBlue,
          ),
        ),
      ),
    );
  }
}