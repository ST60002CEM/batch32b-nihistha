// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetModel _$MeetModelFromJson(Map<String, dynamic> json) => MeetModel(
      id: json['_id'] as String,
      scheduledDate: json['scheduledDate'] as String,
      pickupTime: json['pickupTime'] as String,
      petId: json['petId'] as String,
    );

Map<String, dynamic> _$MeetModelToJson(MeetModel instance) => <String, dynamic>{
      '_id': instance.id,
      'scheduledDate': instance.scheduledDate,
      'pickupTime': instance.pickupTime,
      'petId': instance.petId,
    };
