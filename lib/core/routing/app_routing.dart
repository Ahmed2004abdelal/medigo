import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/features/auth/login/ui/login_screen.dart';
import 'package:medigo/features/onboarding/logic/cubit/onboarding_cubit.dart';
import 'package:medigo/l10n/app_localizations.dart';
import 'package:medigo/splash_screen.dart';

import '../../features/onboarding/ui/onboarding_screen.dart';

class AppRouting {
  AppRouting._();

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return CupertinoPageRoute(
          builder: (_) => BlocProvider<OnboardingCubit>(
            create: (context) => OnboardingCubit(),
            child: OnboardingScreen(),
          ),
        );
      case '/login':
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return CupertinoPageRoute(builder: (_) => const Placeholder());
      case '/home':
        return CupertinoPageRoute(builder: (_) => const Placeholder());
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
          child: Text(AppLocalizations.of(context)!.defaultScreen),
        ),
      ),
    );
  }
}
