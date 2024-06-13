import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(ref.read(authRepositoryProvider));
});

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);


  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    return await _authRepository.registerUser(student);
  }

  Future<Either<Failure, bool>> loginStudent(
      String email, String password) async {
    return await _authRepository.loginUser(email, password);
  }
}
