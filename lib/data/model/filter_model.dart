import '../../core/constants/assets.dart';

class FilterModel {
  String name;
  String? image;
  String value;

  FilterModel({required this.name, this.image, required this.value});
}


List<FilterModel> sortByFilters = [
  FilterModel(name: "Full Name (A-Z)", value: "name_asc"),
  FilterModel(name: "Experience (High → Low)", value: "experience_desc"),
  FilterModel(name: "Rating (High → Low)", value: "rating_desc"),
  FilterModel(name: "Fee (Low → High)", value: "fee_asc"),
  FilterModel(name: "Availability", value: "availability"),
];


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