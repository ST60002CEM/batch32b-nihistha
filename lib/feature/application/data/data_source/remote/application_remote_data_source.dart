import 'package:adoptapet/feature/application/data/model/application_model.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/presentation/view/application_view.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../app/constants/api_endpoints.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/networking/remote/http_service.dart';
import '../../../../../core/shared_prefs/user_shared_prefs.dart';

final applicationRemoteDataSourceProvider = Provider(
      (ref) => ApplicationRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.watch(userSharedPrefsProvider),
    applicationModel: ref.read(applicationModelProvider),
  ),
);

class ApplicationRemoteDataSource{
  final Dio dio;
  final ApplicationModel applicationModel;
  final UserSharedPrefs userSharedPrefs;

  ApplicationRemoteDataSource({
    required this.dio,
    required this.applicationModel,
    required this.userSharedPrefs
  });

  Future<Either<Failure, bool>> createApplication(ApplicationEntity application) async {
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
      var response = await dio.post(
        ApiEndpoints.application,
        data: {
          "name" : application.name,
          "phonenumber": application.phonenumber,
          "email": application.email,
          "address": application.address,
          "age":application.age,
          "occupation":application.occupation,
          "livingSituation":application.livingSituation,
          "haveDog":application.haveDog,
          "reasonsForAdopting":application.reasonsForAdopting,
          "petId":application.petId,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }
  Future<Either<Failure, List<ApplicationEntity>>> getUserApplications() async {
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
      final response = await dio.get(ApiEndpoints.getUserApplication,
        options: Options(headers: {'Authorization': 'Bearer $token'}),);
      print(response);
      if (response.statusCode == 200) {
        final List<dynamic> applicationsJson = response.data['applications'];
        final applications = applicationsJson
            .map((json) => ApplicationModel.fromJson(json).toEntity())
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
  Future<Either<Failure, String>> deleteApplication(String id) async {
    try {
      final response = await dio
          .delete(ApiEndpoints.deleteApplication.replaceFirst("{id}", id));
      return Right(response.data.toString());
      // Handle unexpected status codes
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

  Future<Either<Failure, bool>> updateApplication(ApplicationEntity application) async {
    try {
      final response = await dio.put(
        ApiEndpoints.updateApplication.replaceFirst('{id}', application.appid!),
        data: applicationModel.fromEntity(application),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(error: 'Failed to update customer'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}