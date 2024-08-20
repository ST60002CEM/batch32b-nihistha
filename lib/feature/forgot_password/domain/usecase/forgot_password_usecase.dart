import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/forgot_failure.dart';
import '../../data/repository/forgot_password_remote_repository.dart';
import '../repository/forgot_password_repository.dart';

final forgotPasswordUsecaseProvider = Provider<ForgotPasswordUsecase>((ref) => ForgotPasswordUsecase(
  forgotPasswordRepository: ref.read(forgotPasswordRepositoryProvider),
));

class ForgotPasswordUsecase {
  final IForgotPasswordRepository forgotPasswordRepository;

  ForgotPasswordUsecase({required this.forgotPasswordRepository});

  Future<Either<ForgotPasswordFailure, bool>> sendForgotPasswordEmail(String email) {
    return forgotPasswordRepository.sendForgotPasswordEmail(email);
  }

  Future<Either<ForgotPasswordFailure, bool>> verifyOtpAndResetPassword(String email, String otp, String password) {
    return forgotPasswordRepository.verifyOtpAndResetPassword(email, otp, password);
  }
}
