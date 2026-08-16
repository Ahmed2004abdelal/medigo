// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/constants/assets.dart';

class ConsultationFeesModel {
  String? icon;
  String? name;
  int? cost;
  ConsultationFeesModel({this.icon, this.name, this.cost});
}

Map<String, List<ConsultationFeesModel>> consultationFeesMap = {
  "Online": [
    ConsultationFeesModel(
      icon: Assets.imagesIconesCall,
      name: "Voice Call",
      cost: 10,
    ),
    ConsultationFeesModel(
      icon: Assets.imagesIconesMessaging,
      name: "Messaging",
      cost: 20,
    ),
    ConsultationFeesModel(
      icon: Assets.imagesIconesVideoCall,
      name: "Video Call",
      cost: 30,
    ),
  ],
  "Home Visit": [
    ConsultationFeesModel(
      icon: Assets.imagesIconesHome2,
      name: "Home Visit",
      cost: 100,
    ),
  ],
  "Hospital": [
    ConsultationFeesModel(
      icon: Assets.imagesIconesHospital2,
      name: "Hospital Visit",
      cost: 80,
    ),
  ],
};
