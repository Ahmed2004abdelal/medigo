import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/features/appointment/data/repo/appointment_repository.dart';
import 'package:medigo/features/appointment/logic/appointment_cubit.dart';
import 'package:medigo/features/favorites/data/repo/favorite_repository.dart';
import 'package:medigo/features/favorites/logic/favorite_cubit.dart';

import '../core/di/dependency_injection.dart';
import '../features/home/ui/screens/home_screen.dart';
import '../features/favorites/ui/liked_screen.dart';
import '../features/profile/ui/profile_screen.dart';
import '../core/constants/assets.dart';
import '../features/appointment/ui/screens/appointment_screen.dart';
import 'model/bottom_navigation_model.dart';

// بقت function بدل متغير ثابت — كل نداية بترجع instances جديدة
List<BottomNavigationModel> buildBottomNavigationItems() => [
  BottomNavigationModel(
    id: 1,
    icon: Assets.imagesIconesHome,
    page: HomeScreen(),
  ),
  BottomNavigationModel(
    id: 2,
    icon: Assets.imagesIconesHeartFilled,
    page: BlocProvider<FavoriteCubit>(
      create: (context) =>
          FavoriteCubit(getIt<FavoriteDoctorsRepository>()),
      child: LikedScreen(),
    ),
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