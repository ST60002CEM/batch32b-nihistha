import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../../../../core/error/forgot_failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';


final forgotPasswordRemoteDataSourceProvider = Provider<ForgotPasswordRemoteDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  final userSharedPrefs = ref.read(userSharedPrefsProvider);
  return ForgotPasswordRemoteDataSource(dio, userSharedPrefs);
});

class ForgotPasswordRemoteDataSource {
  final Dio _dio;
  final UserSharedPrefs _userSharedPrefs;

  ForgotPasswordRemoteDataSource(this._dio, this._userSharedPrefs);

  Future<Either<ForgotPasswordFailure, bool>> sendForgotPasswordEmail(String email) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.forgotpassword,
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(ForgotPasswordFailure(
          error: 'Failed to send forgot password email',
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(ForgotPasswordFailure(
        error: e.message.toString(),
        statusCode: e.response?.statusCode.toString(),
      ));
    }
  }

  Future<Either<ForgotPasswordFailure, bool>> verifyOtpAndResetPassword(String email, String otp, String password) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.verifyOtp,
        data: {
          'email': email,
          'otp': otp,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(ForgotPasswordFailure(
          error: 'Failed to verify OTP or reset password',
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(ForgotPasswordFailure(
        error: e.message.toString(),
        statusCode: e.response?.statusCode.toString(),
      ));
    }
  }
}