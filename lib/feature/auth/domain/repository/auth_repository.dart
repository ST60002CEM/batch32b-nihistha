import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../data/repository/auth_local_repository.dart';
import '../entity/auth_entity.dart';


final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authLocalRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
