import 'package:adoptapet/feature/pets_listing/data/repository/pet_listing_repository.dart';
import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';
import 'package:adoptapet/feature/pets_listing/domain/repository/pet_listing_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';

final petListingUseCaseProvider = Provider((ref) {
  return PetListingUseCase(ref.read(petListingRepositoryProvider));
});

class PetListingUseCase {
  final IPetListingRepository _petListingRepository;

  PetListingUseCase(this._petListingRepository);

  Future<Either<Failure, List<PetsListingEntity>>> getPetListings(
      int? page) async {
    return await _petListingRepository.getPetListings(page!);
  }
}