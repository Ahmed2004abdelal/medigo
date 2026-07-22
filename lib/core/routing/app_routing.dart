import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/bottom_nav_bar.dart';
import 'package:medigo/core/routing/routes.dart';
import 'package:medigo/features/appointment/ui/appointment_screen.dart';
import 'package:medigo/features/home/data/models/avilable_doctors_model.dart';
import 'package:medigo/features/home/ui/screens/doctor_details_screen.dart';
import 'package:medigo/features/home/ui/screens/new_appointment_screen.dart';
import 'package:medigo/features/home/ui/screens/patient_details_screen.dart';
import 'package:medigo/features/liked/ui/liked_screen.dart';
import 'package:medigo/features/profile/ui/profile_screen.dart';
import '../di/dependency_injection.dart';
import '../network/auth/supabase_auth_services.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/signup/data/repo/sign_repo.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../features/auth/signup/ui/signup_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/onboarding/logic/cubit/onboarding_cubit.dart';
import '../../splash_screen.dart';

import '../../features/onboarding/ui/onboarding_screen.dart';

class AppRouting {
  AppRouting._();

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
      case Routes.bottomNavigationBar:
        return CupertinoPageRoute(builder: (_) => const BottomNavBar());
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
      case Routes.home:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case Routes.appointment:
        return CupertinoPageRoute(builder: (_) => const AppointmentScreen());
      case Routes.newAppointmentScreen:
        return CupertinoPageRoute(builder: (_) => const NewAppointmentScreen());
      case Routes.patientDetailsScreen:
        return CupertinoPageRoute(builder: (_) => const PatientDetailsScreen());
      case Routes.liked:
        return CupertinoPageRoute(builder: (_) => const LikedScreen());
      case Routes.profile:
        return CupertinoPageRoute(builder: (_) => const ProfileScreen());
      case Routes.doctorDetails:
        final doctor = settings.arguments as AvilableDoctorsModel;
        return CupertinoPageRoute(builder: (_) => DoctorDetailsScreen(doctor: doctor,));
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
