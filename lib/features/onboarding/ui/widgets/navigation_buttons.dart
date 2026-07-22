import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/onboarding_model.dart';
import '../../logic/cubit/onboarding_cubit.dart';

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
            : CustomButton(
                text: 'Previous',
                textStyle: AppTextStyle.font16BritnessBlue600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  side: BorderSide(width: 2.0.w, color: AppColors.britnessBlue),
                ),
                backgroundColor: AppColors.babyBlue,
                size: Size(155.w, 40.h),
                onPressed: () {
                  cubit.previousPage();
                },
              ),
        isFirst ? SizedBox.shrink() : horizontalSpace(16.w),
        CustomButton(
          text: isLast ? 'Get Started' : 'Next',
          textStyle: AppTextStyle.font16White600,
          backgroundColor: AppColors.britnessBlue,
          size: Size(isFirst ? 331.w : 155.w, 40.h),
          onPressed: () {
            isLast
                ? context.pushNamedAndRemoveUntil(
                    Routes.login,
                    predicate: (routes) => false,
                  )
                : cubit.nextPage(onboardingItems.length);
          },
        ),
      ],
    );
  }
}

