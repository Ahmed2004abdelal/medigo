import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../search/data/model/doctor_model.dart';

part 'appointment_model.g.dart';

enum Gender { male, female }

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AppointmentModel {
  final String? doctorId;
  @JsonKey(includeToJson: false)  
  final DoctorModel? doctors;
  @JsonKey(includeToJson: false)  
  final String? id;

  final DateTime? appointmentDatetime;

  final String? consultationType;
  final String? availableSlot;
  final int? consultationFee;
  final String? patientName;
  final String? patientEmail;
  final String? patientPhone;
  final Gender? patientGender;
  final String? age;
  final String? detail;
  final String? status ;

  const AppointmentModel({
    this.id,
    this.doctors,
    this.doctorId,
    this.appointmentDatetime,
    this.consultationType,
    this.availableSlot,
    this.consultationFee,
    this.patientName,
    this.patientEmail,
    this.patientPhone,
    this.patientGender,
    this.age,
    this.detail,
    this.status = 'pending',
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
