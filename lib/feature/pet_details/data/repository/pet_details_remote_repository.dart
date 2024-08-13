import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/pet_details/data/data_source/pet_details_data_source.dart';
import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:adoptapet/feature/pet_details/domain/repository/pet_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final petDetailsRemoteRepositoryProvider = Provider<IPetDetailsRepository>((ref) {
  return PetDetailsRemoteRepository(petDetailsDataSource: ref.read(petDetailsDataSourceProvider));
});

class PetDetailsRemoteRepository implements IPetDetailsRepository{
  final PetDetailsDataSource petDetailsDataSource;

  PetDetailsRemoteRepository({required this.petDetailsDataSource});

  @override
  Future<Either<Failure, PetDetailsEntity>> getPetDetails(String petId) {
    return petDetailsDataSource.getPetDetails(petId);
  }
  //
  // @override
  // Future<Either<Failure, PetDetailsEntity>> getPetsDetails(String petId) {
  //   // TODO: implement getPetsDetails
  //   return petDetailsDataSource.getPetDetails(String petId);
  // }

}