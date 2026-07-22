class WorkingTimeModel {
  final String day;
  final String time;

  WorkingTimeModel({required this.day, required this.time});
}

List<WorkingTimeModel> workingTime = [
  WorkingTimeModel(day: 'Monday', time: '08:00 - 12:00'),
  WorkingTimeModel(day: 'Friday', time: '12:00 - 15:00'),
  WorkingTimeModel(day: 'Saturday', time: '08:00 - 12:00'),
];
