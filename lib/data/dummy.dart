import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/features/appointment/data/repo/appointment_repository.dart';
import 'package:medigo/features/appointment/logic/appointment_cubit.dart';

import '../core/di/dependency_injection.dart';
import '../features/home/ui/screens/home_screen.dart';
import '../features/liked/ui/liked_screen.dart';
import '../features/profile/ui/profile_screen.dart';
import '../core/constants/assets.dart';
import '../features/appointment/ui/screens/appointment_screen.dart';
import 'model/bottom_navigation_model.dart';

List<BottomNavigationModel> bottomNavigationItems = [
  BottomNavigationModel(
    id: 1,
    icon: Assets.imagesIconesHome,
    // page: BlocProvider<HomeCubit>(
    //   create: (context) => HomeCubit(getIt<DoctorRepository>()),
    //   child: HomeScreen(),
    // ),
    page: HomeScreen(),
  ),
  BottomNavigationModel(
    id: 2,
    icon: Assets.imagesIconesHeartFilled,
    page: LikedScreen(),
  ),
  BottomNavigationModel(
    id: 3,
    icon: Assets.imagesIconesCalendar,
    page: BlocProvider<AppointmentCubit>(
      create: (context) => AppointmentCubit(getIt<AppointmentRepository>()),
      child: AppointmentScreen(),
    ),
  ),
  BottomNavigationModel(
    id: 4,
    icon: Assets.imagesIconesUser,
    page: ProfileScreen(),
  ),
];
