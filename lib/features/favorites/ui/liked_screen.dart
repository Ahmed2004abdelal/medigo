import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/features/favorites/logic/favorite_cubit.dart';
import 'package:medigo/features/favorites/logic/favorite_state.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../search/data/model/doctor_model.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        automaticallyImplyActions: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Favorites', style: AppTextStyle.font18Black600), //!text
      ),
      body: SafeArea(
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            switch (state.status) {
              case FavoriteStatus.initial:
              case FavoriteStatus.loading:
                return const _LoadingView();

              case FavoriteStatus.error:
                return _ErrorView(
                  message: state.errorMessage ?? 'Something went wrong', //!text
                  onRetry: () => context.read<FavoriteCubit>().fetchFavorites(),
                );

              case FavoriteStatus.loaded:
                if (state.favoriteDoctors.isEmpty) {
                  return const _EmptyView();
                }
                return _FavoriteDoctorsList(
                  doctors: state.favoriteDoctors,
                  removingDoctorIds: state.removingDoctorIds,
                );
            }
          },
        ),
      ),
    );
  }
}

// ==================== Loading ====================

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.blue));
  }
}

// ==================== Error ====================

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline_rounded, color: Colors.red, size: 48.sp),
            SizedBox(height: 12.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.font14Grey400,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              ),
              child: Text(
                'Try Again',
                style: AppTextStyle.font14Black600.copyWith(
                  color: Colors.white,
                ),
              ), //!text
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== Empty ====================

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.blue,
      onRefresh: () => context.read<FavoriteCubit>().fetchFavorites(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          color: AppColors.lightGrey,
                          size: 64.sp,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'No favorites yet', //!text
                          style: AppTextStyle.font16Black600,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Doctors you like will appear here', //!text
                          textAlign: TextAlign.center,
                          style: AppTextStyle.font14Grey400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ==================== Loaded List ====================

class _FavoriteDoctorsList extends StatelessWidget {
  final List<DoctorModel> doctors;
  final Set<String> removingDoctorIds;
  const _FavoriteDoctorsList({
    required this.doctors,
    required this.removingDoctorIds,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.blue,
      onRefresh: () => context.read<FavoriteCubit>().fetchFavorites(),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemCount: doctors.length,
        separatorBuilder: (_, s) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          final isRemoving = removingDoctorIds.contains(doctor.id);
          return _FavoriteDoctorCard(doctor: doctor, isRemoving: isRemoving);
        },
      ),
    );
  }
}

class _FavoriteDoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final bool isRemoving;
  const _FavoriteDoctorCard({required this.doctor, required this.isRemoving});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isRemoving ? 0.5 : 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withAlpha(60),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                doctor.imageUrl,
                width: 70.w,
                height: 70.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 70.w,
                  height: 70.h,
                  color: Colors.grey[200],
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.font14Black600,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    doctor.specialty,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.font12Grey400,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: AppColors.yellow,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        doctor.rating.toStringAsFixed(1),
                        style: AppTextStyle.font12Black500,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '(${doctor.reviewsCount} Reviews)', //!text
                        style: AppTextStyle.font12Grey400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            isRemoving
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.blue,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      context.read<FavoriteCubit>().favoriteRemove(doctor.id!);
                    },
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: 22.sp,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
