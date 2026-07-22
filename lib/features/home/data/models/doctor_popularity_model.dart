import 'package:flutter/material.dart';
import 'package:medigo/core/constants/assets.dart';
import 'package:medigo/core/theming/app_colors.dart';

class DoctorPopularityModel {
  final String title;
  final String number;
  final String icon;
  final Color color;

  DoctorPopularityModel({
    required this.title,
    required this.number,
    required this.icon,
    required this.color,
  });
}

List<DoctorPopularityModel> popularity = [
  DoctorPopularityModel(
    title: 'Patients',
    number: '1000+',
    icon: Assets.imagesIconesUsers,
    color: AppColors.britnessBabyBlue,
  ),
  DoctorPopularityModel(
    title: 'Experience',
    number: '10 Yrs',
    icon: Assets.imagesIconesBadge,
    color: AppColors.lighterRed,
  ),
  DoctorPopularityModel(
    title: 'Ratings',
    number: '4.5',
    icon: Assets.imagesIconesStarOutline,
    color: AppColors.lighteryellow,
  ),
];
