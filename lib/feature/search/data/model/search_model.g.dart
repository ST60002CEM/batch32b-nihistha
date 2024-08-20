// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      petid: json['_id'] as String,
      petName: json['petName'] as String,
      petType: json['petType'] as String,
      breed: json['breed'] as String,
      gender: json['gender'] as String,
      size: json['size'] as String,
      aboutPet: json['aboutPet'] as String,
      petImage: json['petImage'] as String,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
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
