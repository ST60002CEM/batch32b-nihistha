// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationDto _$ApplicationDtoFromJson(Map<String, dynamic> json) =>
    ApplicationDto(
      data: ApplicationModel.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ApplicationDtoToJson(ApplicationDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
