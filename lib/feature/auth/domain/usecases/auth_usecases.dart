import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/biometric/biometric_auth.dart';
import '../../../../core/biometric/secure_storage.dart';
import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(ref.read(authRepositoryProvider),
      ref.read(biometricAuthProvider), ref.read(secureStorageProvider));
});

class AuthUseCase {
  final IAuthRepository _authRepository;
  final BiometricAuth biometricAuth;
  final SecureStorage secureStorage;

  AuthUseCase(this._authRepository,this.biometricAuth,this.secureStorage);

  Future<Either<Failure, bool>> registerUser(AuthEntity? student) async {
    return await _authRepository.registerUser(student!);
  }

  Future<Either<Failure, bool>> loginUser(
      String? email, String? password) async {
    return await _authRepository.loginUser(email!, password!);
  }
  Future<Either<Failure, bool>> call() async {
    return await _authRepository.logout();
  }
  Future<Either<Failure, bool>> setupFingerprintLogin(
      String email, String password) async {
    // First, authenticate with email and password
    var loginResult = await loginUser(email, password);

    return loginResult.fold((failure) => Left(failure), (success) async {
      if (success) {
        // If login is successful, check if fingerprint can be enabled
        bool canCheckBiometrics = await biometricAuth.canCheckBiometrics();
        if (!canCheckBiometrics) {
          return Left(
              Failure(error: 'Biometrics not available on this device'));
        }

        // Offer to set up fingerprint
        bool fingerprintEnabled =
        await biometricAuth.authenticateWithBiometrics();

        if (fingerprintEnabled) {
          // Store credentials securely on the device
          await secureStorage.write(key: 'user_email', value: email);
          await secureStorage.write(key: 'user_password', value: password);
          return const Right(true);
        } else {
          return Left(Failure(error: 'Fingerprint setup cancelled'));
        }
      } else {
        return Left(Failure(error: 'Login failed'));
      }
    });
  }

  Future<Either<Failure, bool>> loginWithFingerprint() async {
    bool authenticated = await biometricAuth.authenticateWithBiometrics();

    if (authenticated) {
      // Retrieve stored credentials
      String? email = await secureStorage.read(key: 'user_email');
      String? password = await secureStorage.read(key: 'user_password');

      if (email != null && password != null) {
        return await loginUser(email, password);
      } else {
        return Left(Failure(error: 'Stored credentials not found'));
      }
    }

    return Left(Failure(error: 'Biometric authentication failed'));
  }
}
