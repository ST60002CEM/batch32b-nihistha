import 'package:adoptapet/feature/application/presentation/view/application_view.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/application_entity.dart';


@JsonSerializable()
class ApplicationModel {
  @JsonKey(name: '_id')
  final String appid;
  final String name;
  final String occupation;
  final String address;
  final String phonenumber;
  final String email;
  final String haveDog;
  final String livingSituation;
  final int age;
  final String userId;
  final String petId;
  final String reasonsForAdopting;

  ApplicationModel({
    required this.appid,
    required this.userId,
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
      id: id,
      userId: userId,
      petId: petId,
      status: status,
    );
  }

}