import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_starter/app/constants/hive_table_constant.dart';
import 'package:student_management_starter/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_starter/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management_starter/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
      (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel {
  @HiveField(0)
  final String Id;

  @HiveField(1)
  final String fullname;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String password;

  // Constructor
  AuthHiveModel({
    String? Id,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
  }) : Id = Id ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
    Id: '',
    fullname: '',
    email: '',
    phone: '',
    password: '',
  );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
    id: Id,
    fullname: fullname,
    phone: phone,
    email: email,
    password: password,
  );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
    Id: const Uuid().v4(),
    fullname: entity.fullname,
    email: entity.email,
    phone: entity.phone,
    password: entity.password,
  );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'id: $Id, fullname: $fullname, email: $email, phone: $phone, password: $password';
  }
}
