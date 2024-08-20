
import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final String? petid;
  final String petName;
  final String petType;
  final String breed;
  final String gender;
  final String size;
  final String aboutPet;
  final String petImage;

  const SearchEntity({
    this.petid,
    required this.petName,
    required this.petType,
    required this.breed,
    required this.gender,
    required this.size,
    required this.aboutPet,
    required this.petImage,
  });

  @override
  List<Object?> get props =>
      [petid, petName, petType, breed, gender,size,aboutPet,petImage];
}