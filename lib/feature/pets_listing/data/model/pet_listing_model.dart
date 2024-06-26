
import 'package:json_annotation/json_annotation.dart';

part "pet_listing_model.g.dart";
@JsonSerializable()
class PetListingModel{
  final String petName;
  final String petType;
  final String breed;
  final String gender;
  final String size;
  final String aboutPet;
  final String petImage;

  const PetListingModel({
    required this.petName,
    required this.petType,
    required this.breed,
    required this.gender,
    required this.size,
    required this.aboutPet,
    required this.petImage,
});

  factory PetListingModel.fromJson(Map<String, dynamic> json) => _$PetListingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetListingToJson(this);
  @override
  List<Object?> get props => [
    petName,
    petType,
    breed,
    gender,
    size,
    aboutPet,
    petImage
  ];
}