// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) =>
    ApplicationModel(
      appid: json['_id'] as String,
      petId: json['petId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phonenumber: json['phonenumber'] as String,
      age: (json['age'] as num).toInt(),
      address: json['address'] as String,
      occupation: json['occupation'] as String,
      livingSituation: json['livingSituation'] as String,
      reasonsForAdopting: json['reasonsForAdopting'] as String,
      haveDog: json['haveDog'] as bool,
      adminMessage: json['adminMessage'] as String?,
      isApproved: json['isApproved'] as String?,
    );

Map<String, dynamic> _$ApplicationModelToJson(ApplicationModel instance) =>
    <String, dynamic>{
      '_id': instance.appid,
      'name': instance.name,
      'occupation': instance.occupation,
      'address': instance.address,
      'phonenumber': instance.phonenumber,
      'email': instance.email,
      'haveDog': instance.haveDog,
      'livingSituation': instance.livingSituation,
      'age': instance.age,
      'petId': instance.petId,
      'reasonsForAdopting': instance.reasonsForAdopting,
      'isApproved': instance.isApproved,
      'adminMessage': instance.adminMessage,
    };
