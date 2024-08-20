import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/search_failure.dart';
import '../entity/search_enitity.dart';
import '../repository/search_repository.dart';

final searchUsecaseProvider = Provider<SearchUsecase>((ref) => SearchUsecase(
  searchRepository: ref.read(searchRepositoryProvider),
));

class SearchUsecase {
  final ISearchRepository searchRepository;

  SearchUsecase({required this.searchRepository});

  Future<Either<SearchFailure, List<SearchEntity>>> searchProducts(String query, int page, int limit) {
    return searchRepository.searchProducts(query, page, limit);
  }
}
