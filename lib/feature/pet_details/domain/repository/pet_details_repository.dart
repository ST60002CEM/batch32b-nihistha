import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../data/repository/pet_details_remote_repository.dart';

final petDetailsRepositoryProvider = Provider<IPetDetailsRepository>((ref) {
  return ref.read(petDetailsRemoteRepositoryProvider);
});

abstract class IPetDetailsRepository{
  Future<Either<Failure, PetDetailsEntity>> getPetDetails(String petId);
}