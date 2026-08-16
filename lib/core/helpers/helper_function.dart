
String formatHour(String hour) {
  return '${int.parse(hour).toString().padLeft(2, '0')}:00';
}