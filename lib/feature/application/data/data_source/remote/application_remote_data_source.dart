import 'package:adoptapet/feature/application/data/model/application_model.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/presentation/view/application_view.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../app/constants/api_endpoints.dart';
import '../../../../../core/error/failure.dart';

class ApplicationRemoteDataSource{
  final Dio dio;
  final ApplicationModel applicationModel;

  ApplicationRemoteDataSource({
    required this.dio,
    required this.applicationModel,
  });

  Future<Either<Failure, bool>> createApplication(ApplicationEntity application,String petId) async {
    try {
      var response = await dio.post(
        ApiEndpoints.application,
        data: applicationModel.fromEntity(application).toJson(),
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