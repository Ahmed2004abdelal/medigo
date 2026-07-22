import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_routing.dart';
import 'core/routing/routes.dart';
import 'l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
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
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: Locale("en"),
        supportedLocales: [Locale('en'), Locale('ar')],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: Routes.splash,
        onGenerateRoute: AppRouting.generateRoute,
      ),
    );
  }
}
