import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/features/home/logic/new_appointment_cubit/new_appointment_cubit.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/helper_function.dart';
import '../../../../core/theming/app_colors.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../core/widgets/custom_floating_action_button.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  const AppointmentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        title: 'See Appointments',
        onPressed: () {
          context.pushNamed(Routes.bottomNavigationBar, arguments: 2);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesIconesChecked,
              width: 150.w,
              height: 139.h,
            ),
            verticalSpace(24.h),
            Container(
              width: 327.w,
              height: 280.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 33.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(800),
                    blurRadius: 20.r,
                    spreadRadius: -10.r,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                border: Border.all(
                  color: AppColors.successMessageBorder,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Congratulations !',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  verticalSpace(15),
                  CustomRichText(
                    text1:
                        '${context.read<NewAppointmentCubit>().state.fullName[0].toUpperCase()}${context.read<NewAppointmentCubit>().state.fullName.substring(1)}',
                    text2: ', your appointment with',
                  ),
                  verticalSpace(6),
                  CustomRichText(
                    text1:
                        context
                            .read<NewAppointmentCubit>()
                            .state
                            .doctor
                            ?.name ??
                        "Dr. Ayesha Rahman",
                    text2: ' had been created.',
                  ),
                  verticalSpace(17),
                  Divider(color: AppColors.lighterGrey, thickness: 1.h),
                  verticalSpace(17),
                  SuccessDate(
                    text:
                        context
                            .read<NewAppointmentCubit>()
                            .state
                            .appointmentDate
                            ?.toIso8601String()
                            .split('T')
                            .first ??
                        'dd/mm/yyyy',
                    image: Assets.imagesIconesDateIcon,
                  ),
                  verticalSpace(17),
                  SuccessDate(
                    text: formatHour(
                      '${context.read<NewAppointmentCubit>().state.selectedHour ?? 2}',
                    ),

                    image: Assets.imagesIconesClock,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessDate extends StatelessWidget {
  final String image;
  final String text;
  const SuccessDate({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(image, width: 20.w, height: 20.h),
        horizontalSpace(10.w),
        Text(text, style: AppTextStyle.font14Black600),
      ],
    );
  }
}

// imagesIconesDateIcon
// imagesIconesClock
class CustomRichText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final TextStyle? text1Style;
  final TextStyle? text2Style;

  const CustomRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.text1Style,
    this.text2Style,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text1,
        style: text1Style ?? AppTextStyle.font16Black600,
        children: [
          TextSpan(
            text: text2,
            style: text2Style ?? AppTextStyle.font14Grey600,
          ),
        ],
      ),
    );
  }
}
