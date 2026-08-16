import '../../../../core/constants/assets.dart';

class   ConsultationTypeModel {
  final String image;
  final String title;

  ConsultationTypeModel({
    required this.image,
    required this.title,
  });
}


List<ConsultationTypeModel> consultationTypes = [
  ConsultationTypeModel(
    image: Assets.imagesIconesOnline,
    title: 'Online',
  ),
  ConsultationTypeModel(
    image: Assets.imagesIconesHomeVisit,
    title: 'Home Visit',
  ),
  ConsultationTypeModel(
    image: Assets.imagesIconesHospital,
    title: 'Hospital',
  ),
];