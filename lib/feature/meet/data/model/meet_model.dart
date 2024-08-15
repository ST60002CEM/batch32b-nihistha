import 'package:adoptapet/feature/auth/domain/entity/auth_entity.dart';
import 'package:adoptapet/feature/meet/domain/entity/meet_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meet_model.g.dart';

@JsonSerializable()
class MeetModel{
  @JsonKey(name: '_id')
  final String id;
  final String scheduledDate;
  final String pickupTime;
  final String petId;

  MeetModel({
    required this.id,
    required this.scheduledDate,
    required this.pickupTime,
    required this.petId,

  });

  factory MeetModel.fromJson(Map<String, dynamic> json) =>
      _$MeetModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeetModelToJson(this);

  MeetEntity toEntity(){
    return MeetEntity(
        id: id,
        scheduledDate : scheduledDate,
        pickupTime : pickupTime,
        petId : petId,
    );
  }
}