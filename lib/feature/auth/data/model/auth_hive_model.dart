import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../../app/constants/hive_table_constant.dart';
import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
      (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String fullname;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phonenumber;

  @HiveField(4)
  final String password;

  // Constructor
  AuthHiveModel({
    String? id,
    required this.fullname,
    required this.email,
    required this.phonenumber,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
    id: '',
    fullname: '',
    email: '',
    phonenumber: '',
    password: '',
  );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
    id: id,
    fullname: fullname,
    phonenumber: phonenumber,
    email: email,
    password: password,
  );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
    id: const Uuid().v4(),
    fullname: entity.fullname,
    email: entity.email,
    phonenumber: entity.phonenumber,
    password: entity.password,
  );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'id: $id, fullname: $fullname, email: $email, phonenumber: $phonenumber, password: $password';
  }
}
