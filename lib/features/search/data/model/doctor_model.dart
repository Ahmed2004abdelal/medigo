class DoctorModel {
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int reviewsCount;
  final double pricePerHour;
  final int experienceYears;
  final bool isAvailable;

  DoctorModel({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.pricePerHour,
    required this.experienceYears,
    this.isAvailable = true,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      imageUrl: json['image_url'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviews_count'] as int,
      pricePerHour: (json['price_per_hour'] as num).toDouble(),
      experienceYears: json['experience_years'] as int,
      isAvailable: json['is_available'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'image_url': imageUrl,
      'rating': rating,
      'reviews_count': reviewsCount,
      'price_per_hour': pricePerHour,
      'experience_years': experienceYears,
      'is_available': isAvailable,
    };
  }
}
