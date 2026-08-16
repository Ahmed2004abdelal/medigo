import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DoctorModel {
  final String? id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int reviewsCount;
  final double pricePerHour;
  final int experienceYears;
  final bool isAvailable;

  const DoctorModel({
    this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.pricePerHour,
    required this.experienceYears,
    this.isAvailable = true,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
