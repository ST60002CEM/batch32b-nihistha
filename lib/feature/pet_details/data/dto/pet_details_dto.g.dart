// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetDetailsDto _$PetDetailsDtoFromJson(Map<String, dynamic> json) =>
    PetDetailsDto(
      data: PetDetailsModel.fromJson(json['listings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PetDetailsDtoToJson(PetDetailsDto instance) =>
    <String, dynamic>{
      'listings': instance.data,
    };
