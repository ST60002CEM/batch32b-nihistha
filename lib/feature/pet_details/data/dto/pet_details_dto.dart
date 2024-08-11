import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/pet_details_entity.dart';
import '../model/pet_details_model.dart';

part 'pet_details_dto.g.dart';
@JsonSerializable()
class PetDetailsDto{
  @JsonKey(name: 'listings')
  final PetDetailsModel data;

  PetDetailsDto({
    required this.data,
  });

  factory PetDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PetDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetDetailsDtoToJson(this);
}