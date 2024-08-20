import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/forgot_failure.dart';
import '../../domain/repository/forgot_password_repository.dart';
import '../data_source/forgot_password_data_source.dart';

final forgotPasswordRepositoryProvider = Provider<IForgotPasswordRepository>(
      (ref) => ForgotPasswordRepository(
    forgotPasswordRemoteDataSource:
    ref.read(forgotPasswordRemoteDataSourceProvider),
  ),
);

class ForgotPasswordRepository implements IForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource forgotPasswordRemoteDataSource;

  ForgotPasswordRepository({required this.forgotPasswordRemoteDataSource});

  @override
  Future<Either<ForgotPasswordFailure, bool>> sendForgotPasswordEmail(
      String email) {
    return forgotPasswordRemoteDataSource.sendForgotPasswordEmail(email);
  }

  @override
  Future<Either<ForgotPasswordFailure, bool>> verifyOtpAndResetPassword(
      String email, String otp, String password) {
    return forgotPasswordRemoteDataSource.verifyOtpAndResetPassword(
        email, otp, password);
  }
}
