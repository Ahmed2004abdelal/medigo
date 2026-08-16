// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: json['id'] as String?,
      doctors: json['doctors'] == null
          ? null
          : DoctorModel.fromJson(json['doctors'] as Map<String, dynamic>),
      doctorId: json['doctor_id'] as String?,
      appointmentDatetime: json['appointment_datetime'] == null
          ? null
          : DateTime.parse(json['appointment_datetime'] as String),
      consultationType: json['consultation_type'] as String?,
      availableSlot: json['available_slot'] as String?,
      consultationFee: (json['consultation_fee'] as num?)?.toInt(),
      patientName: json['patient_name'] as String?,
      patientEmail: json['patient_email'] as String?,
      patientPhone: json['patient_phone'] as String?,
      patientGender: $enumDecodeNullable(
        _$GenderEnumMap,
        json['patient_gender'],
      ),
      age: json['age'] as String?,
      detail: json['detail'] as String?,
      status: json['status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'appointment_datetime': instance.appointmentDatetime?.toIso8601String(),
      'consultation_type': instance.consultationType,
      'available_slot': instance.availableSlot,
      'consultation_fee': instance.consultationFee,
      'patient_name': instance.patientName,
      'patient_email': instance.patientEmail,
      'patient_phone': instance.patientPhone,
      'patient_gender': _$GenderEnumMap[instance.patientGender],
      'age': instance.age,
      'detail': instance.detail,
      'status': instance.status,
    };

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};
