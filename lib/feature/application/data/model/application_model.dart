import 'package:adoptapet/feature/application/presentation/view/application_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/application_entity.dart';

part 'application_model.g.dart';

final applicationModelProvider = Provider<ApplicationModel>(
      (ref) => ApplicationModel.empty(),
);

@JsonSerializable()
class ApplicationModel {
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
  final String petId;
  final String reasonsForAdopting;

  ApplicationModel({
    required this.appid,
    required this.petId,
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.age,
    required this.address,
    required this.occupation,
    required this.livingSituation,
    required this.reasonsForAdopting,
    required this.haveDog,

  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationModelToJson(this);

  ApplicationEntity toEntity() {
    return ApplicationEntity(
      appid: appid,
      petId: petId,
      name: name,
      address:address,
      age: age,
      phonenumber: phonenumber,
      occupation: occupation,
      livingSituation: livingSituation,
      reasonsForAdopting: reasonsForAdopting,
      email: email,
      haveDog: haveDog
    );
  }

  factory ApplicationModel.empty() {
    return ApplicationModel(
      appid: '',
      petId: '',
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

  ApplicationModel fromEntity(ApplicationEntity entity) => ApplicationModel(
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
    petId: entity.petId,
  );
}