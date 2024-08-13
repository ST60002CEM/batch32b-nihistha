
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/pets_listing_entity.dart';

part "pet_listing_model.g.dart";

final petListingModelProvider = Provider<PetListingModel>((ref) {
  return PetListingModel.empty();
});

@JsonSerializable()
class PetListingModel{
  @JsonKey(name: "_id")
  final String petid;
  final String petName;
  final String petType;
  final String breed;
  final String gender;
  final String size;
  final String aboutPet;
  final String petImage;


  const PetListingModel({
    required this.petid,
    required this.petName,
    required this.petType,
    required this.breed,
    required this.gender,
    required this.size,
    required this.aboutPet,
    required this.petImage,

  });

  factory PetListingModel.empty() {
    return const PetListingModel(
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

  factory PetListingModel.fromJson(Map<String, dynamic> json) => _$PetListingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetListingModelToJson(this);

  PetsListingEntity toEntity(){
    return PetsListingEntity(
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

  List<PetsListingEntity> toEntityList(List<PetListingModel> models) => models.map((model) =>model.toEntity()).toList();

  @override
  List<Object?> get props => [
    petid,
    petName,
    petType,
    breed,
    gender,
    size,
    aboutPet,
    petImage
  ];
}