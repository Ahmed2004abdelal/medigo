import '../../../../core/constants/assets.dart';

class SpecialityModel {
  String id;
  String title;
  String image;

  SpecialityModel({required this.id, required this.title, required this.image});

  @override
  String toString() {
    return 'SpecialityModel{id: $id, title: $title, image: $image}';
  }
}



List<SpecialityModel> specialityItems = [
  SpecialityModel(
    id: "0",
    title: "Dentist",
    image: Assets.imagesSpecialityDentist,
  ),
  SpecialityModel(
    id: "1",
    title: "Ophthalmologist",
    image: Assets.imagesSpecialityOphthalmologist,
  ),
  SpecialityModel(
    id: "2",
    title: "ENT Specialist",
    image: Assets.imagesSpecialityEntSpecialist,
  ),
  SpecialityModel(
    id: "3",
    title: "Otologist",
    image: Assets.imagesSpecialityOtologist,
  ),
  SpecialityModel(
    id: "4",
    title: "Gynecologist",
    image: Assets.imagesSpecialityGynecologist,
  ),
  SpecialityModel(
    id: "5",
    title: "Cardiologist",
    image: Assets.imagesSpecialityCardiologist,
  ),
  SpecialityModel(
    id: "6",
    title: "Gastroenterologist",
    image: Assets.imagesSpecialityGastroenterologist,
  ),
  SpecialityModel(
    id: "7",
    title: "Neurologist",
    image: Assets.imagesSpecialityNeurologist,
  ),
];