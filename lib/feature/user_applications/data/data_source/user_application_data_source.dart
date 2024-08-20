import 'package:adoptapet/feature/user_applications/data/model/user_application_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/user_application_entity.dart';

final userApplicationRemoteDataSourceProvider = Provider(
      (ref) => UserApplicationDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.watch(userSharedPrefsProvider),
        userApplicationModel: ref.read(userApplicationModelProvider),
  ),
);

class UserApplicationDataSource{
  final Dio dio;
  final UserApplicationModel userApplicationModel;
  final UserSharedPrefs userSharedPrefs;

  UserApplicationDataSource({
    required this.dio,
    required this.userApplicationModel,
    required this.userSharedPrefs
  });

  Future<Either<Failure, List<UserApplicationEntity>>> getUserApplicationandDetails() async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
            (l) => token = null,
            (r) => token = r!,
      );

      if (token == null) {
        return Left(Failure(statusCode: '0', error: 'Token null'));
      }
      final response = await dio.get(ApiEndpoints.getApplication,
        options: Options(headers: {'Authorization': 'Bearer $token'}),);
      print(response);
      if (response.statusCode == 200) {
        final List<dynamic> applicationsJson = response.data['applications'];
        if (applicationsJson == null) {
          return Left(Failure(error: 'Applications data is null'));
        }
        final applications = applicationsJson
            .map((json) => UserApplicationModel.fromJson(json).toEntity())
            .toList();
        return Right(applications);
      } else if (response.statusCode == 404) {
        // No applications found
        return const Right([]);
      } else {
        return Left(
          Failure(
            error: 'Failed to fetch applications',
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