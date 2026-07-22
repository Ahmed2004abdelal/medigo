import '../../../../core/constants/assets.dart';

class SocialMediaModel {
  String? name;
  String? image;
  SocialMediaModel({this.name, this.image});
}

List<SocialMediaModel> socialMediaList = [
  SocialMediaModel(
    name: "Google",
    image: Assets.imagesIconesGoogle,
  ),
  SocialMediaModel(
    name: "Facebook",
    image: Assets.imagesIconesFacebook,
  ),
];
