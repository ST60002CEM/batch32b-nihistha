import 'package:adoptapet/feature/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/profile_entity.dart';
import '../model/profile_model.dart';

part 'profile_dto.g.dart';
@JsonSerializable()
class ProfileDTO {
  @JsonKey(name: "data")
  final ProfileModel data;
  final bool success;

  ProfileDTO({
    required this.data,
    required this.success,
  });
  factory ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDTOToJson(this);
}