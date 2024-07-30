import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failure.dart';
import '../../data/repository/pet_listing_repository.dart';

final petListingRepositoryProvider = Provider<IPetListingRepository>((ref) {
  return ref.read(petListingRemoteRepositoryProvider);
});

abstract class IPetListingRepository {
  Future<Either<Failure, List<PetsListingEntity>>> getPetListings(int page);
}