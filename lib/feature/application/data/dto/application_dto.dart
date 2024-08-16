

import 'package:adoptapet/feature/application/data/model/application_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/application_model.dart';

part 'application_dto.g.dart';
@JsonSerializable()
class ApplicationDto {

  @JsonKey(name: "applications")
  final ApplicationModel data;
  final bool success;
  final String message;

  ApplicationDto({
    required this.data,
    required this.success,
    required this.message
  });
  factory ApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationDtoToJson(this);
}