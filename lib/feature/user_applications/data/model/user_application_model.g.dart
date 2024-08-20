// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApplicationModel _$UserApplicationModelFromJson(
        Map<String, dynamic> json) =>
    UserApplicationModel(
      appid: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phonenumber: json['phonenumber'] as String,
      age: (json['age'] as num).toInt(),
      address: json['address'] as String,
      occupation: json['occupation'] as String,
      livingSituation: json['livingSituation'] as String,
      reasonsForAdopting: json['reasonsForAdopting'] as String,
      haveDog: json['haveDog'] as bool,
      petDetails: json['petId'] == null
          ? null
          : PetDetailsModel.fromJson(json['petId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserApplicationModelToJson(
        UserApplicationModel instance) =>
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
      'reasonsForAdopting': instance.reasonsForAdopting,
      'petId': instance.petDetails,
    };