import 'package:adoptapet/app/constants/api_endpoints.dart';
import 'package:adoptapet/feature/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/networking/remote/http_service.dart';
import '../../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../dto/get_current_user_dto.dart';

final authRemoteDataSourceProvider = Provider(
      (ref) => AuthRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class AuthRemoteDataSource{
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  AuthRemoteDataSource({required this.dio, required this.userSharedPrefs});

  Future<Either<Failure,bool>> registerUser(AuthEntity user) async{
    try{
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "fullname" : user.fullname,
          "phonenumber": user.phonenumber,
          "email": user.email,
          "password": user.password
        }
      );
      if(response.statusCode == 200){
        return const Right(true);
      }else{
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString()
          )
        );
      }
    }on DioException catch(e){
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString()??'0',
        )
      );
    }
  }

  Future<Either<Failure, bool>> loginUser(
      String email,
      String password,
      ) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        String token = response.data["token"];
        // Save token to shared prefs
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
            (l) => token = null,
            (r) => token = r!,
      );

      var response = await dio.get(
        ApiEndpoints.currentUser,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        GetCurrentUserDto getCurrentUserDto = GetCurrentUserDto.fromJson(response.data);

        return Right(getCurrentUserDto.toEntity());
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}