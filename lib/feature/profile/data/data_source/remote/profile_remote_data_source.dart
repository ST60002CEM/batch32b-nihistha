import 'package:adoptapet/feature/profile/data/dto/profile_dto.dart';
import 'package:adoptapet/feature/profile/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../app/constants/api_endpoints.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/networking/remote/http_service.dart';
import '../../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../../../auth/domain/entity/auth_entity.dart';

final profileRemoteDataSourceProvider = Provider(
      (ref) => ProfileRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider)),
);

class ProfileRemoteDataSource{
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  ProfileRemoteDataSource({
    required this.dio,
    required this.userSharedPrefs
  });
  Future<Either<Failure, ProfileEntity>> getCurrentUser() async {
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
        ProfileDTO profileDTO = ProfileDTO.fromJson(response.data);
        return Right(profileDTO.data.toEntity());
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