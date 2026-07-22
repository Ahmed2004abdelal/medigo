import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constants/assets.dart';
import 'core/helpers/extension.dart';
import 'core/helpers/spacing.dart';
import 'core/network/auth/supabase_auth_services.dart';
import 'core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  final SupabaseAuthServices authServices;
  const SplashScreen(this.authServices, {super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _navigated = false; // عشان مانعملش navigation أكتر من مرة
  bool _authReady = false; // الـ auth جهز؟
  bool _brandingDone = false; // عدّت الـ 3 ثواني؟

  @override
  void initState() {
    super.initState();
    // المؤقّت يتعمل مرة واحدة بس هنا (مش في build)
    Future.delayed(const Duration(seconds: 3), () {
      _brandingDone = true;
      _tryGoNext();
    });
  }

  void _tryGoNext() {
    // لازم الاتنين يخلصوا: الـ auth جاهز + عدّت الـ 3 ثواني
    if (_navigated || !_authReady || !_brandingDone) return;
    _navigated = true;

    if (widget.authServices.isLoggedIn()) {
      context.pushNamedAndRemoveUntil(Routes.bottomNavigationBar, predicate: (route) => false);
    } else {
      context.pushNamedAndRemoveUntil(
        Routes.onboarding,
        predicate: (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: widget.authServices.authStateChanges(),
      builder: (context, snapshot) {
        // ✅ طول ما لسه بيستنى أول حدث → فضل في السبلاش
        if (snapshot.connectionState != ConnectionState.waiting) {
          // أول ما الـ auth يجهز → علّم إنه جاهز وحاول تنتقل
          _authReady = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _tryGoNext();
          });
        }

        // في كل الحالات بنعرض شاشة السبلاش (لحد ما الـ navigation يحصل)
        return _buildSplashUI();
      },
    );
  }

  Widget _buildSplashUI() {
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