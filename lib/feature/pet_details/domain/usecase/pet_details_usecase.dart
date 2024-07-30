import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../pets_listing/domain/entity/pets_listing_entity.dart';
import '../entity/pet_details_entity.dart';
import '../repository/pet_details_repository.dart';

class PetDetailsUseCase{

  final IPetDetailsRepository _petDetailsRepository;

  PetDetailsUseCase(this._petDetailsRepository);

  Future<Either<Failure, PetDetailsEntity>> getPetDetails() async {
    return await _petDetailsRepository.getPetsDetails();
  }
}