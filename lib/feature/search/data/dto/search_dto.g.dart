// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDto _$SearchDtoFromJson(Map<String, dynamic> json) => SearchDto(
      success: json['success'] as bool,
      data: (json['listings'] as List<dynamic>?)
              ?.map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SearchDtoToJson(SearchDto instance) => <String, dynamic>{
      'success': instance.success,
      'listings': instance.data,
    };
