import 'package:adoptapet/feature/application/presentation/view/application_view.dart';
import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../pet_details/data/model/pet_details_model.dart';
import '../../domain/entity/user_application_entity.dart';

part 'user_application_model.g.dart';

final userApplicationModelProvider = Provider<UserApplicationModel>(
      (ref) => UserApplicationModel.empty(),
);

@JsonSerializable()
class UserApplicationModel {
  @JsonKey(name: '_id')
  final String appid;
  final String name;
  final String occupation;
  final String address;
  final String phonenumber;
  final String email;
  final bool haveDog;
  final String livingSituation;
  final int age;
  final String reasonsForAdopting;
  @JsonKey(name: 'petId')
  final PetDetailsModel? petDetails;

  UserApplicationModel({
    required this.appid,
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.age,
    required this.address,
    required this.occupation,
    required this.livingSituation,
    required this.reasonsForAdopting,
    required this.haveDog,
    this.petDetails
  });

  factory UserApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$UserApplicationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApplicationModelToJson(this);

  UserApplicationEntity toEntity() {
    return UserApplicationEntity(
        appid: appid,
        name: name,
        address:address,
        age: age,
        phonenumber: phonenumber,
        occupation: occupation,
        livingSituation: livingSituation,
        reasonsForAdopting: reasonsForAdopting,
        email: email,
        haveDog: haveDog,
        petDetails: petDetails
    );
  }

  factory UserApplicationModel.empty() {
    return UserApplicationModel(
      appid: '',
      petDetails: null,
      name: '',
      address: '',
      age: 0,
      phonenumber: '',
      occupation: '',
      livingSituation: '',
      reasonsForAdopting: '',
      email: '',
      haveDog: false,
    );
  }

  UserApplicationModel fromEntity(UserApplicationEntity entity) => UserApplicationModel(
    appid: entity.appid ?? '',
    name: entity.name,
    age: entity.age,
    occupation: entity.occupation,
    address: entity.address,
    email: entity.email,
    phonenumber: entity.phonenumber,
    haveDog: entity.haveDog,
    livingSituation: entity.livingSituation,
    reasonsForAdopting: entity.reasonsForAdopting,
    petDetails: entity.petDetails
  );
}