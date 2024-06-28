
import 'package:json_annotation/json_annotation.dart';

part "pet_listing_model.g.dart";
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

  factory PetListingModel.fromJson(Map<String, dynamic> json) => _$PetListingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetListingModelToJson(this);
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