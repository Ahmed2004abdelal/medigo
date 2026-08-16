import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_style.dart';

import '../../../search/data/model/doctor_model.dart';
import '../../logic/home_cubit/home_cubit.dart';
import '../../logic/home_cubit/home_state.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
            return const SizedBox.shrink();
          case HomeStatus.loading:
            return _buildSkeletonLoading();
          case HomeStatus.loaded:
            return _buildDoctorsList(
              context: context,
              doctors: state.doctors,
              hasNextPage: state.hasNextPage,
              isLoadingMore: state.isLoadingMore,
            );
          case HomeStatus.error:
            return _buildError(
              context,
              state.errorMessage ?? 'Something went wrong',
            );
        }
      },
    );
  }

  // ==================== Loaded State ====================

  Widget _buildDoctorsList({
    required BuildContext context,
    required List<DoctorModel> doctors,
    required bool hasNextPage,
    required bool isLoadingMore,
  }) {
    if (doctors.isEmpty) {
      return SizedBox(
        height: 135.h,
        child: const Center(child: Text('لا يوجد أطباء حاليًا')),
      );
    }

    return SizedBox(
      height: 135.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length + (hasNextPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == doctors.length) {
            return _buildSeeMoreCard(context, isLoadingMore);
          }

          final doctor = doctors[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(Routes.doctorDetails, arguments: doctor);
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(
                start: index == 0 ? 0.w : 10.w,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  SizedBox(
                    height: 135.h,
                    width: 130.w,
                    child: Image.network(
                      doctor.imageUrl,
                      height: 135.h,
                      width: 129.w,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.person, size: 40),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: SpinKitFadingCircle(
                              color: AppColors.blue,
                              size: 40.0.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45.withAlpha(120),
                      ),
                      height: 44.h,
                      width: 129.w,
                      padding: EdgeInsetsDirectional.only(
                        start: 13.w,
                        top: 5.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: AppTextStyle.font13White600.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            doctor.specialty,
                            style: AppTextStyle.font11LighterBlue400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSeeMoreCard(BuildContext context, bool isLoadingMore) {
    return GestureDetector(
      onTap: isLoadingMore ? null : () => context.read<HomeCubit>().loadMore(),
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 10.w),
        width: 90.w,
        height: 135.h,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.blue.shade100),
        ),
        child: Center(
          child: isLoadingMore
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: SpinKitFadingCircle(
                    color: AppColors.blue,
                    size: 40.0.sp,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                    SizedBox(height: 6.h),
                    Text(
                      'See more',
                      style: AppTextStyle.font11LighterBlue400.copyWith(
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // ==================== Loading State (أول تحميل) ====================

  Widget _buildSkeletonLoading() {
    final fakeDoctors = List.generate(
      4,
      (index) => DoctorModel(
        // id: 1,
        name: 'Dr. Placeholder Name',
        specialty: 'Specialty',
        imageUrl: '',
        rating: 4.5,
        reviewsCount: 100,
        pricePerHour: 20,
        experienceYears: 5,
        isAvailable: true,
      ),
    );

    return SizedBox(
      height: 135.h,
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: fakeDoctors.length,
          itemBuilder: (context, index) {
            final doctor = fakeDoctors[index];
            return Container(
              margin: EdgeInsetsDirectional.only(
                start: index == 0 ? 0.w : 10.w,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  SizedBox(
                    height: 135.h,
                    width: 130.w,
                    child: Container(
                      color: Colors.grey[300], // بديل الصورة وقت التحميل
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45.withAlpha(120),
                      ),
                      height: 44.h,
                      width: 129.w,
                      padding: EdgeInsetsDirectional.only(
                        start: 13.w,
                        top: 5.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            doctor.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.font13White600,
                          ),
                          Text(
                            doctor.specialty,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.font11LighterBlue400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ==================== Error State ====================

  Widget _buildError(BuildContext context, String message) {
    return SizedBox(
      height: 135.h,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.font11LighterBlue400.copyWith(
                color: Colors.red,
              ),
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () => context.read<HomeCubit>().loadMore(),
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}
