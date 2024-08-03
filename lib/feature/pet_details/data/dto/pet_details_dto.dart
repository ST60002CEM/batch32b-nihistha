import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/pet_details_entity.dart';

part 'pet_details_dto.g.dart';
@JsonSerializable()
class PetDetailsDto{
  @JsonKey(name: "_id")
  final String id;
  final String petName;
  final String breed;
  final String petType;
  final String gender;
  final String size;
  final String aboutPet;
  final String petImage;

  PetDetailsDto({
    required this.id,
    required this.petName,
    required this.breed,
    required this.petType,
    required this.gender,
    required this.size,
    required this.aboutPet,
    required this.petImage,

  });
  PetDetailsEntity toEntity(){
    return PetDetailsEntity(
        petid:id,
        petName:petName,
        petType:petType,
        breed:breed,
        gender:gender,
        size:size,
        petImage:petImage,
        aboutPet:aboutPet
    );
  }

  factory PetDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PetDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetDetailsDtoToJson(this);
}