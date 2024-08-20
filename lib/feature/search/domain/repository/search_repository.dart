import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/search_failure.dart';
import '../../data/repository/search_remote_repository.dart';
import '../entity/search_enitity.dart';

final searchRepositoryProvider = Provider<ISearchRepository>(
      (ref) => ref.read(searchRemoteRepositoryProvider),
);

abstract class ISearchRepository{
  Future<Either<SearchFailure, List<SearchEntity>>> searchProducts(String query, int page, int limit);
}