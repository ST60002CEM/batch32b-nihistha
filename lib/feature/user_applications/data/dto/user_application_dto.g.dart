// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApplicationDto _$UserApplicationDtoFromJson(Map<String, dynamic> json) =>
    UserApplicationDto(
      data: UserApplicationModel.fromJson(
          json['applications'] as Map<String, dynamic>),
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserApplicationDtoToJson(UserApplicationDto instance) =>
    <String, dynamic>{
      'applications': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
