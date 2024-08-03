import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';



part 'pet_details_model.g.dart';

final petDetailsModelProvider = Provider<PetDetailsModel>((ref) {
  return PetDetailsModel.empty();
});
@JsonSerializable()
class PetDetailsModel{
  @JsonKey(name: "_id")
  final String petid;
  final String petName;
  final String petType;
  final String breed;
  final String gender;
  final String size;
  final String aboutPet;
  final String petImage;


  const PetDetailsModel({
    required this.petid,
    required this.petName,
    required this.petType,
    required this.breed,
    required this.gender,
    required this.size,
    required this.aboutPet,
    required this.petImage,

  });

  factory PetDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PetDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetDetailsModelToJson(this);


  factory PetDetailsModel.empty() {
    return const PetDetailsModel(
      petid: '',
      petName: '',
      petImage: '',
      petType: '',
      breed: '',
      gender: '',
      aboutPet: '',
      size: '',
    );
  }


  PetDetailsEntity toEntity(){
    return PetDetailsEntity(
        petid:petid,
        petName: petName,
        petType: petType,
        breed: breed,
        gender: gender,
        size: size,
        aboutPet: aboutPet,
        petImage: petImage
    );
  }
}