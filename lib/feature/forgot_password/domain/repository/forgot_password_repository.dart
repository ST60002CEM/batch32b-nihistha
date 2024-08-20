import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/forgot_failure.dart';
import '../../data/repository/forgot_password_remote_repository.dart';

final forgotPasswordProvider = Provider<IForgotPasswordRepository>(
      (ref) => ref.read(forgotPasswordRepositoryProvider),
);

abstract class IForgotPasswordRepository {
  Future<Either<ForgotPasswordFailure, bool>> sendForgotPasswordEmail(String email);
  Future<Either<ForgotPasswordFailure, bool>> verifyOtpAndResetPassword(String email, String otp, String password);
}
