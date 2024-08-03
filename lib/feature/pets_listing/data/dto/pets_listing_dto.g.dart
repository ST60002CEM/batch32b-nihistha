// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetsListingDto _$PetsListingDtoFromJson(Map<String, dynamic> json) =>
    PetsListingDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => PetListingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PetsListingDtoToJson(PetsListingDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
