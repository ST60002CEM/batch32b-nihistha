import 'package:adoptapet/core/error/search_failure.dart';
import 'package:adoptapet/feature/search/data/data_source/search_remote_data_source.dart';
import 'package:adoptapet/feature/search/domain/entity/search_enitity.dart';
import 'package:adoptapet/feature/search/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchRemoteRepositoryProvider = Provider<ISearchRepository>(
      (ref) => SearchRemoteRepository(
        searchRemoteDataSource: ref.read(searchRemoteDataSourceProvider),
  ),
);

class SearchRemoteRepository implements ISearchRepository{

  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRemoteRepository({required this.searchRemoteDataSource});

  @override
  Future<Either<SearchFailure, List<SearchEntity>>> searchProducts(String query, int page, int limit) {
    // TODO: implement searchProducts
    return searchRemoteDataSource.searchProducts(query, page, limit);
  }

}