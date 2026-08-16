// Flutter & Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Bottom Nav & Test
import 'package:medigo/bottom_nav_bar.dart';
// Core
import 'package:medigo/core/routing/routes.dart';
// Home
import 'package:medigo/features/home/data/repo/doctor_repository.dart';
import 'package:medigo/features/home/data/repo/new_appointment_repository.dart';
import 'package:medigo/features/home/logic/home_cubit/home_cubit.dart';
import 'package:medigo/features/home/logic/new_appointment_cubit/new_appointment_cubit.dart';
import 'package:medigo/features/home/ui/screens/appointment_success_screen.dart';
import 'package:medigo/features/home/ui/screens/doctor_details_screen.dart';
import 'package:medigo/features/home/ui/screens/new_appointment_screen.dart';
import 'package:medigo/features/home/ui/screens/patient_details_screen.dart';
// Liked & Profile
import 'package:medigo/features/liked/ui/liked_screen.dart';
import 'package:medigo/features/profile/ui/profile_screen.dart';
// Search
import 'package:medigo/features/search/data/model/doctor_model.dart';
import 'package:medigo/test.dart';

// Auth - Login
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/login/ui/login_screen.dart';
// Auth - Signup
import '../../features/auth/signup/data/repo/sign_repo.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../features/auth/signup/ui/signup_screen.dart';
import '../../features/onboarding/logic/cubit/onboarding_cubit.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/search/logic/search_cubit.dart';
import '../../features/search/ui/search_screen.dart';
// Splash & Onboarding
import '../../splash_screen.dart';
import '../di/dependency_injection.dart';
import '../network/auth/supabase_auth_services.dart';

class AppRouting {
  AppRouting._();

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ---------- Splash & Onboarding ----------
      case Routes.splash:
        return CupertinoPageRoute(
          builder: (_) => SplashScreen(getIt<SupabaseAuthServices>()),
        );

      case Routes.onboarding:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<OnboardingCubit>(
            create: (context) => OnboardingCubit(),
            child: OnboardingScreen(),
          ),
        );

      // ---------- Auth ----------
      case Routes.login:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(getIt<LoginRepo>()),
            child: LoginScreen(),
          ),
        );

      case Routes.signup:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(getIt<SignUpRepo>()),
            child: SignupScreen(),
          ),
        );

      // ---------- Main Navigation ----------
      case Routes.bottomNavigationBar:
        final selectedIndex = settings.arguments as int? ?? 0;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(getIt<DoctorRepository>()),
            child: BottomNavBar(selectedIndex: selectedIndex),
          ),
        );

      // case Routes.home:
      //   return CupertinoPageRoute(
      //     builder: (_) => BlocProvider<HomeCubit>(
      //       create: (context) => HomeCubit(getIt<DoctorRepository>()),
      //       child: HomeScreen(),
      //     ),
      //   );

      // ---------- Doctor & Search ----------
      case Routes.search:
        final args = settings.arguments as Map<String, dynamic>?;
        final searchQuery = args?['title'] as String?;
        final specailizationLogo = args?['specializationLogo'] as String?;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<SearchCubit>(
            create: (context) =>
                SearchCubit(getIt<DoctorRepository>())
                  ..fetchDoctors(searchQuery: searchQuery ?? ''),
            child: SearchScreen(
              logo: specailizationLogo,
              searchQuery: searchQuery,
            ),
          ),
        );

      // ---------- Appointment ----------
      case Routes.doctorDetails:
        final doctor = settings.arguments as DoctorModel;
        return CupertinoPageRoute(
          builder: (_) => DoctorDetailsScreen(doctor: doctor),
        );
      case Routes.newAppointmentScreen:
        final doctorId = settings.arguments as String?;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<NewAppointmentCubit>(
            create: (context) => NewAppointmentCubit(
              newAppointmentRepository: getIt<NewAppointmentRepository>(),
            )..setDoctorId(doctorId ?? ''),
            child: NewAppointmentScreen(),
          ),
        );

      case Routes.patientDetailsScreen:
        final cubit = settings.arguments as NewAppointmentCubit;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<NewAppointmentCubit>.value(
            value: cubit,
            child: PatientDetailsScreen(),
          ),
        );

      case Routes.appointmentSuccessScreen:
        final cubit = settings.arguments as NewAppointmentCubit;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<NewAppointmentCubit>.value(
            value: cubit,
            child: const AppointmentSuccessScreen(),
          ),
        );

      // ---------- Liked & Profile ----------
      case Routes.liked:
        return CupertinoPageRoute(builder: (_) => const LikedScreen());

      case Routes.profile:
        return CupertinoPageRoute(builder: (_) => ProfileScreen());

      // ---------- Test ----------
      case Routes.test:
        return CupertinoPageRoute(builder: (_) => const TestScreen());

      default:
        return null;
    }
  }
}

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("no route defined...!"),
        ),
      ),
    );
  }
}
