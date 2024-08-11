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

}