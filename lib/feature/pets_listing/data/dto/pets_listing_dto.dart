
import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pets_listing_dto.g.dart';

@JsonSerializable()
class PetsListingDto{
  @JsonKey(name: "_id")
  final String petid;
  final String petName;
  final String petType;
  final String breed;
  final String gender;
  final String size;
  final String aboutPet;
  final String petImage;

  PetsListingDto({
    required this.petid,
    required this.petName,
    required this.petType,
    required this.breed,
    required this.gender,
    required this.size,
    required this.aboutPet,
    required this.petImage,
});


  factory PetsListingDto.fromJson(Map<String, dynamic> json) =>
      _$PetsListingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetsListingDtoToJson(this);
}