// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetDetailsModel _$PetDetailsModelFromJson(Map<String, dynamic> json) =>
    PetDetailsModel(
      petid: json['_id'] as String,
      petName: json['petName'] as String,
      petType: json['petType'] as String,
      breed: json['breed'] as String,
      gender: json['gender'] as String,
      size: json['size'] as String,
      aboutPet: json['aboutPet'] as String,
      petImage: json['petImage'] as String,
    );

Map<String, dynamic> _$PetDetailsModelToJson(PetDetailsModel instance) =>
    <String, dynamic>{
      '_id': instance.petid,
      'petName': instance.petName,
      'petType': instance.petType,
      'breed': instance.breed,
      'gender': instance.gender,
      'size': instance.size,
      'aboutPet': instance.aboutPet,
      'petImage': instance.petImage,
    };
