import '../../../../core/constants/assets.dart';

class AvilableDoctorsModel {
  final String name;
  final String image;
  final String specialties;

  AvilableDoctorsModel(this.name, this.image, this.specialties);
}

List<AvilableDoctorsModel> doctors = [
  AvilableDoctorsModel("Dr. Sarah", Assets.imagesDoctorDoctor1, 'Otologist'),
  AvilableDoctorsModel("Dr. Noble Thorme", Assets.imagesDoctorDoctor2, 'Otologist'),
  AvilableDoctorsModel("Dr. Sama", Assets.imagesDoctorDoctor3, 'Otologist'),
  AvilableDoctorsModel("Dr. Shahd", Assets.imagesDoctorDoctor4, 'Otologist'),
  AvilableDoctorsModel("Dr. Nancy", Assets.imagesDoctorDoctor5, 'Otologist'),
  AvilableDoctorsModel("Dr. Adham", Assets.imagesDoctorDoctor6, 'Otologist'),
  AvilableDoctorsModel("Dr. Fatma", Assets.imagesDoctorDoctor7, 'Otologist'),
];