import 'package:adoptapet/feature/auth/domain/entity/auth_entity.dart';
import 'package:adoptapet/feature/profile/domain/entity/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel{
  @JsonKey(name: '_id')
  final String id;
  final String fullname;
  final String email;
  final String phonenumber;


  ProfileModel({
    required this.id,
    required this.fullname,
    required this.phonenumber,
    required this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  ProfileEntity toEntity(){
    return ProfileEntity(
        id: id,
        fullname: fullname,
        email: email,
        phonenumber: phonenumber,

    );
  }
}