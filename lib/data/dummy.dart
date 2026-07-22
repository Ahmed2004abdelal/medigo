import 'package:medigo/features/appointment/ui/appointment_screen.dart';
import 'package:medigo/features/home/ui/screens/home_screen.dart';
// import 'package:medigo/features/liked/appointment/ui/appointment_screen.dart';
import 'package:medigo/features/liked/ui/liked_screen.dart';
import 'package:medigo/features/profile/ui/profile_screen.dart';
import '../core/constants/assets.dart';
import 'model/bottom_navigation_model.dart';
import 'model/feel_model.dart';
import 'model/filter_model.dart';

List<FilterModel> availabilityFilters = [
  FilterModel(
    name: "Morning",
    value: "morning",
    image: Assets.imagesIconesMorning,
  ),
  FilterModel(
    name: "Afternoon",
    value: "afternoon",
    image: Assets.imagesIconesAfternoon,
  ),
  FilterModel(name: "Night", value: "night", image: Assets.imagesIconesNight),
];

List<FilterModel> consultationTypeFilters = [
  FilterModel(
    name: "Online",
    value: "online",
    image: Assets.imagesIconesOnline,
  ),
  FilterModel(
    name: "Home visit",
    value: "home_visit",
    image: Assets.imagesIconesHomeVisit,
  ),
  FilterModel(
    name: "Hospital",
    value: "hospital",
    image: Assets.imagesIconesHospital,
  ),
];

List<FilterModel> genderFilters = [
  FilterModel(name: "Male", value: "male", image: Assets.imagesIconesMale),
  FilterModel(
    name: "Female",
    value: "female",
    image: Assets.imagesIconesFemale,
  ),
];

List<FilterModel> ratingFilters = [
  FilterModel(name: "1", value: "1", image: Assets.imagesIconesStar),
  FilterModel(name: "2", value: "2", image: Assets.imagesIconesStar),
  FilterModel(name: "3", value: "3", image: Assets.imagesIconesStar),
  FilterModel(name: "4", value: "4", image: Assets.imagesIconesStar),
  FilterModel(name: "5", value: "5", image: Assets.imagesIconesStar),
];

List<FilterModel> experienceFilters = [
  FilterModel(
    name: "0–5 years",
    value: "1-3",
    image: Assets.imagesIconesExperience,
  ),
  FilterModel(
    name: "5–10 years",
    value: "4-6",
    image: Assets.imagesIconesExperience,
  ),
  FilterModel(
    name: "10+ years",
    value: "7+",
    image: Assets.imagesIconesExperience,
  ),
];

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

List<FilterModel> sortByFilters = [
  FilterModel(name: "Full Name (A-Z)", value: "name_asc"),
  FilterModel(name: "Experience (High → Low)", value: "experience_desc"),
  FilterModel(name: "Rating (High → Low)", value: "rating_desc"),
  FilterModel(name: "Fee (Low → High)", value: "fee_asc"),
  FilterModel(name: "Availability", value: "availability"),
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



