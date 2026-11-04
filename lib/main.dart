import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/features/home/data/repo/doctor_repository.dart';
import 'package:medigo/features/home/data/repo/favorite_toggle_repository.dart';
import 'package:medigo/features/home/logic/home_cubit/home_cubit.dart';
import 'package:medigo/features/home/logic/home_cubit/home_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_routing.dart';
import 'core/routing/routes.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cbyakgpkiypqzzypjtwb.supabase.co',
    publishableKey: 'sb_publishable_jNdd9HdRnwf8xPf9KMfEeg_3X152q3D',
  );
  setupGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(
          getIt<DoctorRepository>(),
          getIt<FavoriteToggleRepository>(),
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              previous.languageCode != current.languageCode,
          builder: (context, state) {
              debugPrint('MaterialApp BlocBuilder rebuilding, cubit hashCode: ${context.read<HomeCubit>().hashCode}, state: ${state.languageCode}');

            final languageCode = state.languageCode.isNotEmpty
                ? state.languageCode
                : 'en';

            return MaterialApp(
              theme: ThemeData(scaffoldBackgroundColor: Colors.white),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              locale: Locale(languageCode),
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              initialRoute: Routes.splash,
              onGenerateRoute: AppRouting.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
