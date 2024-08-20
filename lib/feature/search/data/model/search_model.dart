
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/search_enitity.dart';

part "search_model.g.dart";

final searchModelProvider = Provider<SearchModel>((ref) {
  return SearchModel.empty();
});

@JsonSerializable()
class SearchModel{
  @JsonKey(name: "_id")
  final String petid;
  final String petName;
  final String petType;
  final String breed;
  final String gender;
  final String size;
  final String aboutPet;
  final String petImage;


  const SearchModel({
    required this.petid,
    required this.petName,
    required this.petType,
    required this.breed,
    required this.gender,
    required this.size,
    required this.aboutPet,
    required this.petImage,

  });

  factory SearchModel.empty() {
    return const SearchModel(
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

  factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  SearchEntity toEntity(){
    return SearchEntity(
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

  List<SearchEntity> toEntityList(List<SearchModel> models) => models.map((model) =>model.toEntity()).toList();

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