// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessAppointmentModel _$SuccessAppointmentModelFromJson(
  Map<String, dynamic> json,
) => SuccessAppointmentModel(
  patientName: json['patientName'] as String?,
  doctorName: json['doctorName'] as String?,
  date: json['date'] as String?,
  time: json['time'] as String?,
);

// ignore: unused_element
Map<String, dynamic> _$SuccessAppointmentModelToJson(
  SuccessAppointmentModel instance,
) => <String, dynamic>{
  'patientName': instance.patientName,
  'doctorName': instance.doctorName,
  'date': instance.date,
  'time': instance.time,
};
