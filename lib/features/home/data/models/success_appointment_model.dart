import 'package:json_annotation/json_annotation.dart';

part 'success_appointment_model.g.dart';

@JsonSerializable()
class SuccessAppointmentModel {
  final String? patientName;
  final String? doctorName;
  final String? date;
  final String? time;

  SuccessAppointmentModel({
    this.patientName,
    this.doctorName,
    this.date,
    this.time,
  });

  factory SuccessAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$SuccessAppointmentModelFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessAppointmentModelToJson(this);
}

