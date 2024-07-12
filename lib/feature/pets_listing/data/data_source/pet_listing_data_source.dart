import 'package:adoptapet/feature/pets_listing/data/model/pet_listing_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/constants/api_endpoints.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../../domain/entity/pets_listing_entity.dart';
import '../dto/pets_listing_dto.dart';

final petListingDataSourceProvider = Provider<PetListingDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  return PetListingDataSource(
    dio: dio,
    petListingModel: ref.read(petListingModelProvider),
  );
});

class PetListingDataSource {
  final Dio dio;
  final PetListingModel petListingModel;
  PetListingDataSource({ required this.dio,required this.petListingModel});
  Future<Either<Failure, List<PetsListingEntity>>> getPetListings(int page) async {
    try {
      final response = await dio.get(
        ApiEndpoints.listings,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );

      PetsListingDto getPetsListingDto = PetsListingDto.fromJson(response.data);
      return Right(petListingModel.toEntityList(getPetsListingDto.data));
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
