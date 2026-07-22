import 'package:json_annotation/json_annotation.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class SignupModel {
  String? fullName;
  String? phoneNumber;

  SignupModel({this.fullName, this.phoneNumber});

  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      _$SignupModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupModelToJson(this);
}