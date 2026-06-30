import 'package:medigo/core/constants/assets.dart';

class OnboardingModel {
  String title;
  String description;
  String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}



List<OnboardingModel> onboardingItems = [
  OnboardingModel(
    title: "Your Health, Our Priority",
    description:
        "We look after the well-being of your entire family. Find the right doctor and book an appointment\n with complete peace of mind",
    image: Assets.imagesOnboard1,
  ),
  OnboardingModel(
    title: "Take Care of Your Loved Ones",
    description:
        "From pediatrics to general medicine and beyond,\nmanage your whole family's health simply,\nquickly, and securely.",
    image: Assets.imagesOnboard2,
  ),
  OnboardingModel(
    title: "Your Family Health Partner",
    description:
        "Because your family's health is precious, we put\nthe best healthcare professionals within your\nreach.",
    image: Assets.imagesOnboard3,
  ),
];