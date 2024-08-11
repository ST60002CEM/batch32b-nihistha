import 'package:adoptapet/feature/pet_details/data/dto/pet_details_dto.dart';
import 'package:adoptapet/feature/pet_details/data/model/pet_details_model.dart';
import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../../../pets_listing/domain/entity/pets_listing_entity.dart';


final petDetailsDataSourceProvider = Provider<PetDetailsDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  return PetDetailsDataSource(
    dio: dio,
    petDetailsModel: ref.read(petDetailsModelProvider),
  );
});

class PetDetailsDataSource{
  final Dio dio;
  final PetDetailsModel petDetailsModel;
  PetDetailsDataSource({
    required this.dio,
    required this.petDetailsModel
});
  Future<Either<Failure, PetDetailsEntity>> getPetDetails(String petId) async {
    try {
      final response = await dio.get('${ApiEndpoints.petDetail}/$petId');

      if (response.statusCode == 201) {
        print('${response.data}');
        final getAllPetDto = PetDetailsModel.fromJson(response.data);
        final petDetails = getAllPetDto.toEntity();
        return Right(petDetails);
      } else {
        return Left(
          Failure(error: 'Product Failed to achieved', statusCode: '0'),
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
