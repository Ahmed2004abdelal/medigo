// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  id: json['id'] as String?,
  name: json['name'] as String,
  specialty: json['specialty'] as String,
  imageUrl: json['image_url'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
  pricePerHour: (json['price_per_hour'] as num).toDouble(),
  experienceYears: (json['experience_years'] as num).toInt(),
  isAvailable: json['is_available'] as bool? ?? true,
);

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'image_url': instance.imageUrl,
      'rating': instance.rating,
      'reviews_count': instance.reviewsCount,
      'price_per_hour': instance.pricePerHour,
      'experience_years': instance.experienceYears,
      'is_available': instance.isAvailable,
    };
