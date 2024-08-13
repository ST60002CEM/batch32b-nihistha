import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../pets_listing/domain/entity/pets_listing_entity.dart';
import '../entity/pet_details_entity.dart';
import '../repository/pet_details_repository.dart';

final petDetailsUseCaseProvider =
Provider<PetDetailsUseCase>((ref) => PetDetailsUseCase(
  petDetailsRepository: ref.read(petDetailsRepositoryProvider),
));

class PetDetailsUseCase{

  final IPetDetailsRepository petDetailsRepository;

  PetDetailsUseCase({required this.petDetailsRepository});

  Future<Either<Failure, PetDetailsEntity>> getPetDetails(String petId) async {
    return await petDetailsRepository.getPetDetails(petId);
  }
}