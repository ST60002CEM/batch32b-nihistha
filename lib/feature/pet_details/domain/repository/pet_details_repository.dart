import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';

final petDetailsRepository = Provider<IPetDetailsRepository>((ref) {
  return ref.read(petListingRepositoryProvider);
});

abstract class IPetDetailsRepository{
  Future<Either<Failure, PetDetailsEntity>> getPetsDetails();
}