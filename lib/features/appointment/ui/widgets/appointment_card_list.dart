import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/helpers/extension.dart';
import 'package:medigo/core/helpers/spacing.dart';
import 'package:medigo/core/theming/app_text_style.dart';
import 'package:medigo/core/widgets/custom_button.dart';
import 'package:medigo/features/appointment/logic/appointment_state.dart';
import 'package:medigo/features/home/data/models/appointment_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../logic/appointment_cubit.dart';

enum States { upcoming, completed, cancelled }

class AppointmentCardList extends StatelessWidget {
  final AppointmentStatus status;
  final List<AppointmentModel> appointments;
  final String? errorMessage;
  final String emptyMessage;
  final States state;

  const AppointmentCardList({
    super.key,
    required this.state,
    required this.status,
    required this.appointments,
    this.errorMessage,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      AppointmentStatus.initial => const SizedBox.shrink(),
      AppointmentStatus.loading => Skeletonizer(
        enabled: true,
        child: AppointmentCard(state: state),
      ),
      AppointmentStatus.success =>
        appointments.isEmpty
            ? Center(
                child: Text(emptyMessage, style: AppTextStyle.font14Grey400),
              )
            : ListView.separated(
                itemCount: appointments.length,
                separatorBuilder: (_, _) => verticalSpace(20.h),
                itemBuilder: (_, i) =>
                    AppointmentCard(appointment: appointments[i], state: state),
              ),
      AppointmentStatus.error => Center(
        child: Text(
          errorMessage ?? 'An error occurred',
          style: AppTextStyle.font24Red500,
        ),
      ),
    };
  }
}

class DateAndTime extends StatelessWidget {
  final String iconPath;
  final String title;
  final String date;
  const DateAndTime({
    super.key,
    required this.iconPath,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconCircleAvatar(iconPath: iconPath),
        horizontalSpace(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyle.font12Grey400),
            verticalSpace(6.h),
            Text(date, style: AppTextStyle.font14Black600),
          ],
        ),
      ],
    );
  }
}

class IconCircleAvatar extends StatelessWidget {
  final String iconPath;
  const IconCircleAvatar({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15.r,
      backgroundColor: AppColors.blue3,
      child: Padding(
        padding: EdgeInsets.all(5.0.w),
        child: SvgPicture.asset(
          iconPath,
          width: 15.w,
          height: 15.h,
          colorFilter: ColorFilter.mode(
            AppColors.britnessBlue,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final States? state;
  final AppointmentModel? appointment;
  const AppointmentCard({super.key, this.state, this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 15.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  // backgroundImage: Image
                  child: ClipOval(
                    child: Image.network(
                      appointment?.doctors?.imageUrl ?? '',
                      width: 60.r,
                      height: 60.r,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60.r,
                          height: 60.r,
                          color: AppColors.blue3,
                          child: Icon(
                            Icons.person,
                            size: 30.r,
                            color: AppColors.britnessBlue,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 60.r,
                          height: 60.r,
                          color: AppColors.blue3,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                horizontalSpace(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment?.doctors?.name ?? 'Dr. .......',
                      style: AppTextStyle.font14Black600,
                    ),
                    verticalSpace(6.h),
                    Text(
                      appointment?.doctors?.specialty ?? 'not specified',
                      style: AppTextStyle.font12Grey400,
                    ),
                  ],
                ),
                Spacer(),
                IconCircleAvatar(iconPath: Assets.imagesIconesVideoCall),
              ],
            ),
            verticalSpace(15.h),
            Row(
              children: [
                DateAndTime(
                  iconPath: Assets.imagesIconesDateIcon,
                  title: 'Date',
                  date: context.read<AppointmentCubit>().formatDate(
                    appointment?.appointmentDatetime,
                  ),
                ),
                horizontalSpace(30.w),
                DateAndTime(
                  iconPath: Assets.imagesIconesClock,
                  title: 'Time',
                  date: context.read<AppointmentCubit>().formatTime(
                    appointment?.appointmentDatetime,
                  ),
                ),
              ],
            ),
            Divider(color: AppColors.lighterGrey, thickness: 1.h, height: 20.h),
            // verticalSpace(10.h),
            switch (state!) {
              States.completed => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    backgroundColor: AppColors.lighterGrey,
                    text: "Re-book",
                    onPressed: () {
                      context.pushNamed(
                        Routes.newAppointmentScreen,
                        arguments: appointment?.doctors?.id,
                      );
                    },
                    size: Size(123.w, 35.h),
                    textStyle: AppTextStyle.font12Black600,
                  ),
                  CustomButton(
                    backgroundColor: Colors.red,
                    text: "Leave Review",
                    onPressed: () {},
                    size: Size(123.w, 35.h),
                    textStyle: AppTextStyle.font12White600,
                  ),
                ],
              ),
              States.upcoming => CustomButton(
                backgroundColor: Colors.red,
                text: "cancel",
                onPressed: () {
                  context.read<AppointmentCubit>().cancelAppointment(
                    appointment?.id ?? '',
                  );
                },
                size: Size(double.infinity.w, 35.h),
                textStyle: AppTextStyle.font12White600,
              ),
              States.cancelled => CustomButton(
                textStyle: AppTextStyle.font12Black600,
                backgroundColor: AppColors.lighterGrey,
                text: "Re-book",
                onPressed: () {
                  context.pushNamed(
                    Routes.newAppointmentScreen,
                    arguments: appointment?.doctors?.id,
                  );
                },
              ),
            },
          ],
        ),
      ),
    );
  }
}
