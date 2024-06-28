// import 'package:adoptapet/feature/pets_listing/data/model/pet_listing_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../app/constants/api_endpoints.dart';
// import '../../../../core/error/failure.dart';
// import '../../../../core/networking/remote/http_service.dart';
//
// final photoDataSourceProvider = Provider.autoDispose(
//         (ref) => PhotoDataSource(ref.read(httpServiceProvider)));
//
// class PhotoDataSource {
//   final Dio _dio;
//   PhotoDataSource(this._dio);
//   Future<Either<Failure, List<PetListingModel>>> getPhotos(int page) async {
//     try {
//       final response = await _dio.get(
//         ApiEndpoints.photos,
//         queryParameters: {
//           '_page': page,
//           '_limit': ApiEndpoints.limitPage,
//         },
//       );
//       final data = response.data as List;
//       final photos = data.map((e) => PetListingModel.fromJson(e)).toList();
//       return Right(photos);
//     } on DioException catch (e) {
//
//       return Left(
//         Failure(
//           error: e.error.toString(),
//           statusCode: e.response?.statusCode.toString() ?? '0',
//         ),
//       );
//     }
//   }
// }
