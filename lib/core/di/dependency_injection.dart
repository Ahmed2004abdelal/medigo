import 'package:get_it/get_it.dart';
import 'package:medigo/features/appointment/logic/appointment_cubit.dart';
import '../../features/appointment/data/repo/appointment_repository.dart';
import '../../features/home/data/repo/doctor_repository.dart';
import '../../features/home/data/repo/new_appointment_repository.dart';
import '../../features/search/logic/search_cubit.dart';
import '../network/auth/supabase_auth_services.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/signup/data/repo/sign_repo.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../network/database/supabase_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  SupabaseClient supabase = Supabase.instance.client;

  getIt.registerLazySingleton<SupabaseAuthServices>(
    () => SupabaseAuthServicesImpl(supabase),
  );
  getIt.registerLazySingleton<SupabaseService>(
    () => SupabaseServiceImpl(supabase),
  );

  getIt.registerLazySingleton<SplashScreen>(
    () => SplashScreen(getIt<SupabaseAuthServices>()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(getIt<SupabaseAuthServices>()),
  );
  getIt.registerLazySingleton<DoctorRepository>(
    () => DoctorRepository(
      getIt<SupabaseService>(),
      getIt<SupabaseAuthServices>(),
    ),
  );

  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignUpRepo>()));

  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt<SupabaseAuthServices>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(getIt<DoctorRepository>()),
  );

  getIt.registerLazySingleton<NewAppointmentRepository>(
    () => NewAppointmentRepository(getIt<SupabaseService>()),
  );

getIt.registerLazySingleton<AppointmentRepository>(
  () => AppointmentRepositoryImpl(Supabase.instance.client),
);
  getIt.registerFactory<AppointmentCubit>(() => AppointmentCubit(getIt<AppointmentRepository>()));
}
