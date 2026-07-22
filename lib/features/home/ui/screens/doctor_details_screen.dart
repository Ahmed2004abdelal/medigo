import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/constants/assets.dart';
import 'package:medigo/core/helpers/extension.dart';
import 'package:medigo/core/helpers/spacing.dart';
import 'package:medigo/core/routing/routes.dart';
import 'package:medigo/core/theming/app_colors.dart';
import 'package:medigo/core/theming/app_text_style.dart';
import 'package:medigo/features/home/data/models/avilable_doctors_model.dart';
import 'package:medigo/features/home/data/models/doctor_popularity_model.dart';
import 'package:medigo/features/home/data/models/working_time_model.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final AvilableDoctorsModel doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.blue,
        ),
        margin: EdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 5.h),
        width: double.infinity,
        height: 45.h,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: AppColors.blue,
          onPressed: () {
            context.pushNamed(Routes.newAppointmentScreen);
          },
          child: Text("Book Appointment", style: AppTextStyle.font16White600),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarDetails(title: doctor.name,onTap: (){},),
                verticalSpace(19),
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  height: 350.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Image.asset(
                    doctor.image,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                verticalSpace(10),
                NameAndPrice(doctor: doctor),
                verticalSpace(16),
                Popularity(),
                verticalSpace(16),
                Text("About", style: AppTextStyle.font14Black600),
                verticalSpace(15),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: AppTextStyle.font12Grey400,
                  textAlign: TextAlign.justify,
                ),
                verticalSpace(16),
                Text("Working Time", style: AppTextStyle.font14Black600),
                verticalSpace(15),
                WorkingTimeDisplay(),
                verticalSpace(60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkingTimeDisplay extends StatelessWidget {
  const WorkingTimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: workingTime.length * 41.h + workingTime.length * 14.h,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: workingTime.length,
        itemBuilder: (context, index) {
          final time = workingTime[index];
          return Container(
            margin: EdgeInsets.only(top: index == 0 ? 0 : 14.h),
            padding: EdgeInsetsDirectional.fromSTEB(15.w, 6.h, 15.w, 6.h),
            width: double.infinity,
            height: 41.h,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time.day, style: AppTextStyle.font14Black600),
                Text(time.time, style: AppTextStyle.font13Grey600),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Popularity extends StatelessWidget {
  const Popularity({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: popularity.length,
        itemBuilder: (context, index) {
          final item = popularity[index];
          return Container(
            margin: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 14.w),
            width: 100.w,
            height: 130.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  spreadRadius: 1.r,
                  blurRadius: .2.r,
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 9.h),
                  alignment: AlignmentDirectional.bottomCenter,
                  height: 63.h,
                  width: 44.55.w,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                  child: SvgPicture.asset(item.icon, width: 25.w, height: 25.h),
                ),
                verticalSpace(17),
                Text(item.number, style: AppTextStyle.font15Black700),
                verticalSpace(3),
                Text(item.title, style: AppTextStyle.font11Grey500),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NameAndPrice extends StatelessWidget {
  const NameAndPrice({super.key, required this.doctor});

  final AvilableDoctorsModel doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 12.h,
          children: [
            Text(doctor.name, style: AppTextStyle.font16Black600),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              decoration: BoxDecoration(
                color: AppColors.lighteryellow,
                borderRadius: BorderRadius.circular(97),
              ),
              child: Text(
                doctor.specialties,
                style: AppTextStyle.font14Yellow500,
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "\$15", style: AppTextStyle.font24Blue500),
              TextSpan(text: '/hr', style: AppTextStyle.font14Blue400),
            ],
          ),
        ),
      ],
    );
  }
}

class AppBarDetails extends StatelessWidget {
  final String title;
  final bool? suffix;
  final void Function()? onTap;
  const AppBarDetails({
    super.key, 
    required this.title, 
    this.suffix = true,
    this.onTap,
    }
    );


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey[200]!),
              borderRadius: BorderRadiusGeometry.circular(5.r),
            ),
            child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
          ),
        ),
        horizontalSpace(16),
        Text(title, style: AppTextStyle.font14Black600),
        Spacer(),
        suffix!
            ? GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  Assets.imagesIconesHeart,
                  width: 20.w,
                  height: 17.h,
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
