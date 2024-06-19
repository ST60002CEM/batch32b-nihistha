import 'package:adoptapet/app/constants/api_endpoints.dart';
import 'package:adoptapet/feature/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/networking/remote/http_service.dart';

final authRemoteDataSource = Provider(
      (ref) => AuthRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    // userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class AuthRemoteDataSource{
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

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
}