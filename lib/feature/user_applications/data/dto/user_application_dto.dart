import 'package:json_annotation/json_annotation.dart';

import '../model/user_application_model.dart';

part 'user_application_dto.g.dart';
@JsonSerializable()
class UserApplicationDto {

  @JsonKey(name: "applications")
  final UserApplicationModel data;
  final bool success;
  final String message;

  UserApplicationDto({
    required this.data,
    required this.success,
    required this.message
  });
  factory UserApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$UserApplicationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserApplicationDtoToJson(this);
}