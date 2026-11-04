import '../../../../core/constants/assets.dart';

class SpecialityModel {
  String id;
  String titleKey;
  String image;

  SpecialityModel({
    required this.id,
    required this.titleKey,
    required this.image,
  });

  @override
  String toString() {
    return 'SpecialityModel{id: $id, titleKey: $titleKey, image: $image}';
  }
}

List<SpecialityModel> specialityItems = [
  SpecialityModel(
    id: "0",
    titleKey: "Dentist",
    image: Assets.imagesSpecialityDentist,
  ),
  SpecialityModel(
    id: "1",
    titleKey: "Ophthalmologist",
    image: Assets.imagesSpecialityOphthalmologist,
  ),
  SpecialityModel(
    id: "2",
    titleKey: "ENTSpecialist",
    image: Assets.imagesSpecialityEntSpecialist,
  ),
  SpecialityModel(
    id: "3",
    titleKey: "Otologist",
    image: Assets.imagesSpecialityOtologist,
  ),
  SpecialityModel(
    id: "4",
    titleKey: "Gynecologist",
    image: Assets.imagesSpecialityGynecologist,
  ),
  SpecialityModel(
    id: "5",
    titleKey: "Cardiologist",
    image: Assets.imagesSpecialityCardiologist,
  ),
  SpecialityModel(
    id: "6",
    titleKey: "Gastroenterologist",
    image: Assets.imagesSpecialityGastroenterologist,
  ),
  SpecialityModel(
    id: "7",
    titleKey: "Neurologist",
    image: Assets.imagesSpecialityNeurologist,
  ),
];
