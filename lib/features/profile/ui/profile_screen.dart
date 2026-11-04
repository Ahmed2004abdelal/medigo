import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/core/helpers/extension.dart';
import 'package:medigo/core/helpers/spacing.dart';
import 'package:medigo/core/theming/app_colors.dart';
import 'package:medigo/core/theming/app_text_style.dart';
import 'package:medigo/features/home/logic/home_cubit/home_cubit.dart';
import 'package:medigo/features/home/logic/home_cubit/home_state.dart';
import 'package:medigo/l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/auth/supabase_auth_services.dart';
import '../../../core/routing/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SupabaseAuthServices _authServices = SupabaseAuthServicesImpl(
    Supabase.instance.client,
  );

  void _handleLogout(BuildContext context) {
    _authServices.signOut().then((result) {
      result.fold(
        (failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sign-out failed: ${failure.message}')),
          );
        },
        (unit) {
          context.pushNamedAndRemoveUntil(
            Routes.login,
            predicate: (route) => false,
          );
        },
      );
    });
  }

  void _handleLanguageToggle(bool value, BuildContext context) {
    context.read<HomeCubit>().changeLanguage(value ? 'en' : 'ar');
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // غيّر العنوان مؤقتًا عشان الاختبار
        title: Text(l10n.profile, style: AppTextStyle.font16Black600),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(24),

            CircleAvatar(
              radius: 45.r,
              backgroundColor: AppColors.britnessBabyBlue,
              child: Icon(
                Icons.person,
                size: 50.sp,
                color: AppColors.britnessBlue,
              ),
            ),

            verticalSpace(12),

            Text(
              user?.userMetadata?['fullName'] ?? l10n.user,
              style: AppTextStyle.font18Black600,
            ),
            verticalSpace(4),
            Text(user?.email ?? '', style: AppTextStyle.font14Grey400),

            verticalSpace(32),

            _ProfileMenuItem(
              icon: Icons.person_outline,
              title: l10n.editProfile,
              onTap: () {
                // TODO: navigate to edit profile
              },
            ),
            _ProfileMenuItem(
              icon: Icons.calendar_today_outlined,
              title: l10n.myAppointments,
              onTap: () {
                // TODO: navigate to appointments
              },
            ),
            _ProfileMenuItem(
              icon: Icons.notifications_none,
              title: l10n.notifications,
              onTap: () {
                // TODO: navigate to notifications
              },
            ),

            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.languageCode != current.languageCode,
              builder: (context, state) {
                return _ProfileLanguageToggle(
                  isEnglish: state.languageCode == 'en',
                  onChanged: (value) => _handleLanguageToggle(value, context),
                );
              },
            ),

            verticalSpace(24),
            Divider(color: AppColors.lightGrey, thickness: 1),
            verticalSpace(16),

            // Logout
            _ProfileMenuItem(
              icon: Icons.logout,
              title: l10n.logout,
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () => _handleLogout(context),
            ),

            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: (iconColor ?? AppColors.britnessBlue).withAlpha(26),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                size: 20.sp,
                color: iconColor ?? AppColors.britnessBlue,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.font14Black600.copyWith(color: textColor),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14.sp, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}

class _ProfileLanguageToggle extends StatelessWidget {
  final bool isEnglish;
  final ValueChanged<bool> onChanged;

  const _ProfileLanguageToggle({
    required this.isEnglish,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.britnessBlue.withAlpha(26),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.language,
              size: 20.sp,
              color: AppColors.britnessBlue,
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Row(
              children: [
                Text(l10n.language, style: AppTextStyle.font14Black600),
                horizontalSpace(8),
                Text(
                  AppLocalizations.of(context)!.locale,
                  style: AppTextStyle.font12Grey500,
                ),
              ],
            ),
          ),

          horizontalSpace(6),
          Switch(
            value: isEnglish,
            onChanged: onChanged,
            activeThumbColor: AppColors.britnessBlue,
          ),
        ],
      ),
    );
  }
}
