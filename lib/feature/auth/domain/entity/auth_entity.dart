

import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String fullname;
  final String email;
  final String phone;
  final String password;

  const AuthEntity({
    this.id,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [id, fullname, phone, email, password];
}
