
import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/pet_listing_model.dart';

part 'pets_listing_dto.g.dart';

@JsonSerializable()
class PetsListingDto{
  final bool success;
  @JsonKey(name: 'listings', defaultValue: [])
  final List<PetListingModel> data;

  PetsListingDto({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$PetsListingDtoToJson(this);

  factory PetsListingDto.fromJson(Map<String, dynamic> json) =>
      _$PetsListingDtoFromJson(json);
}