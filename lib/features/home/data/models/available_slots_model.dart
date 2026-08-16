import '../../../../core/constants/assets.dart';

class AvailableSlotsModel {


  String? name;
  String? image;
  String? value;

  AvailableSlotsModel({required this.name, this.image, required this.value});
}


List<AvailableSlotsModel> availabilityFilters = [
  AvailableSlotsModel(
    name: "Morning",
    value: "morning",
    image: Assets.imagesIconesMorning,
  ),
  AvailableSlotsModel(
    name: "Afternoon",
    value: "afternoon",
    image: Assets.imagesIconesAfternoon,
  ),
  AvailableSlotsModel(name: "Night", value: "night", image: Assets.imagesIconesNight),
];


class AvailableTime {
  final int hour;
  AvailableTime({required this.hour});
}

Map<String, List<AvailableTime>> availableTimesMap = {
  "morning": [
    AvailableTime(hour: 8),
    AvailableTime(hour: 9),
    AvailableTime(hour: 10),
    AvailableTime(hour: 11),
  ],
  "afternoon": [
    AvailableTime(hour: 12),
    AvailableTime(hour: 13),
    AvailableTime(hour: 14),
    AvailableTime(hour: 15),
    AvailableTime(hour: 16),
  ],
  "night": [
    AvailableTime(hour: 17),
    AvailableTime(hour: 18),
    AvailableTime(hour: 19),
    AvailableTime(hour: 20),
    AvailableTime(hour: 21),
  ],
};