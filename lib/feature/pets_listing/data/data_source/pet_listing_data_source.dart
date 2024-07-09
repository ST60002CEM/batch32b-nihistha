import 'package:adoptapet/feature/pets_listing/data/model/pet_listing_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/constants/api_endpoints.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/networking/remote/http_service.dart';

final petListingDataSourceProvider = Provider.autoDispose(
        (ref) => PetListingDataSource(ref.read(httpServiceProvider)));

class PetListingDataSource {
  final Dio _dio;
  PetListingDataSource(this._dio);
  Future<Either<Failure, List<PetListingModel>>> getPetListings(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.listings,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );
      // ProjectDto
      final data = response.data as List;
      final listings = data.map((e) => PetListingModel.fromJson(e)).toList();
      return Right(listings);
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
