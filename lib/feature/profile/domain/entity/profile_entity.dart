

import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? id;
  final String fullname;
  final String email;
  final String phonenumber;


  const ProfileEntity({
    this.id,
    required this.fullname,
    required this.email,
    required this.phonenumber,

  });

  @override
  List<Object?> get props =>
      [id, fullname, phonenumber, email, ];
}
