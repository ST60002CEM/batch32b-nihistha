// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetDetailsDto _$PetDetailsDtoFromJson(Map<String, dynamic> json) =>
    PetDetailsDto(
      id: json['_id'] as String,
      petName: json['petName'] as String,
      breed: json['breed'] as String,
      petType: json['petType'] as String,
      gender: json['gender'] as String,
      size: json['size'] as String,
      aboutPet: json['aboutPet'] as String,
      petImage: json['petImage'] as String,
    );

Map<String, dynamic> _$PetDetailsDtoToJson(PetDetailsDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'petName': instance.petName,
      'breed': instance.breed,
      'petType': instance.petType,
      'gender': instance.gender,
      'size': instance.size,
      'aboutPet': instance.aboutPet,
      'petImage': instance.petImage,
    };
