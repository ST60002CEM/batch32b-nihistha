import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../../../../core/error/search_failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/search_enitity.dart';
import '../dto/search_dto.dart';

final searchRemoteDataSourceProvider = Provider<SearchRemoteDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  final userSharedPrefs = ref
      .read(userSharedPrefsProvider); // Retrieve the UserSharedPrefs instance
  return SearchRemoteDataSource(dio, userSharedPrefs);
});

class SearchRemoteDataSource {
  final Dio _dio;
  final UserSharedPrefs _userSharedPrefs;

  SearchRemoteDataSource(this._dio, this._userSharedPrefs);

  Future<Either<SearchFailure, List<SearchEntity>>> searchProducts(
      String query, int page, int limit) async {
    try {
      String? token;
      var data = await _userSharedPrefs.getUserToken();
      data.fold(
            (l) => token = null,
            (r) => token = r!,
      );

      final response = await _dio.get(
        ApiEndpoints.search,
        queryParameters: {
          'search': query,
          'page': page,
          'limit': limit,
        },
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : {}),
      );

      if (response.statusCode == 200) {
        final getSearchDto = SearchDto.fromJson(response.data);
        final products = getSearchDto.data.map((e) => e.toEntity()).toList();
        return Right(products);
      } else {
        return const Left(
          SearchFailure(message: 'Search failed to achieve'),
        );
      }
    } on DioException catch (e) {
      return Left(SearchFailure(message: e.message.toString()));
    }
  }
}
