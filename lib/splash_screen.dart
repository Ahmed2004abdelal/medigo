import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/constants/assets.dart';
import 'package:medigo/core/helpers/extension.dart';
import 'package:medigo/core/helpers/spacing.dart';
import 'package:medigo/core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    context.pushNamedAndRemoveUntil(
      Routes.onboarding,
      predicate: (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4E8CF7), Color(0xff1A69F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                Assets.imagesLogoLogoImage,
                width: 84.w,
                height: 84.h,
              ),
              verticalSpace(16.h),
              Text(
                'Medigo',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              verticalSpace(265),
              SpinKitFadingCircle(color: Colors.white, size: 40.0.sp),
            ],
          ),
        ),
      ),
    );
  }
}
