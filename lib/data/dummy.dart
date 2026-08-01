import 'package:medigo/features/appointment/ui/appointment_screen.dart';
import 'package:medigo/features/home/ui/screens/home_screen.dart';
// import 'package:medigo/features/liked/appointment/ui/appointment_screen.dart';
import 'package:medigo/features/liked/ui/liked_screen.dart';
import 'package:medigo/features/profile/ui/profile_screen.dart';
import '../core/constants/assets.dart';
import 'model/bottom_navigation_model.dart';
import 'model/feel_model.dart';



List<BottomNavigationModel> bottomNavigationItems = [
  BottomNavigationModel(
    id: 1,
    icon: Assets.imagesIconesHome,
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
    page: AppointmentScreen(),
  ),
  BottomNavigationModel(
    id: 4,
    icon: Assets.imagesIconesUser,
    page: ProfileScreen(),
  ),
];



List<FeelModel> fees = [
  FeelModel(
    name: "Voice Call",
    price: 10,
    icon: Assets.imagesIconesCall,
    value: "voice_call",
  ),
  FeelModel(
    name: "Messaging",
    price: 5,
    icon: Assets.imagesIconesMessaging,
    value: "messaging",
  ),
  FeelModel(
    name: "Video Call",
    price: 20,
    icon: Assets.imagesIconesVideoCall,
    value: "video_call",
  ),
];



