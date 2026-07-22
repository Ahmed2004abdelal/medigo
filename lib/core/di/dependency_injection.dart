import 'package:get_it/get_it.dart';
import '../network/auth/supabase_auth_services.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/signup/data/repo/sign_repo.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;



Future<void> setupGetit() async {
  SupabaseClient supabase = Supabase.instance.client;

  getIt.registerLazySingleton<SupabaseAuthServices>(
    () => SupabaseAuthServicesImpl(supabase),
  );
  getIt.registerLazySingleton<SplashScreen>(
    () => SplashScreen(getIt<SupabaseAuthServices>()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(getIt<SupabaseAuthServices>()),
  );

  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignUpRepo>()));

  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt<SupabaseAuthServices>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
