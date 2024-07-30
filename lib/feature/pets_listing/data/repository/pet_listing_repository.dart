import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/pets_listing_entity.dart';
import '../../domain/repository/pet_listing_repository.dart';
import '../data_source/pet_listing_data_source.dart';

final petListingRemoteRepositoryProvider = Provider<IPetListingRepository>((ref) {
  return PetListingRepository(petListingDataSource: ref.read(petListingDataSourceProvider));
});

class PetListingRepository implements IPetListingRepository {
  final PetListingDataSource petListingDataSource;

  PetListingRepository({required this.petListingDataSource});

  @override
  Future<Either<Failure, List<PetsListingEntity>>> getPetListings(int page) {
    // TODO: implement getPetListings
    return petListingDataSource.getPetListings(page);
  }


}