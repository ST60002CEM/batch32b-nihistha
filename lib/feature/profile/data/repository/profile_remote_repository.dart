import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:adoptapet/feature/profile/domain/entity/profile_entity.dart';
import 'package:adoptapet/feature/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRemoteRepositoryProvider = Provider<IProfileRepository>((ref) {
  return ProfileRemoteRepository(ref.read(profileRemoteDataSourceProvider));
});

class ProfileRemoteRepository extends IProfileRepository{
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRemoteRepository(
     this.profileRemoteDataSource
  );
  @override
  Future<Either<Failure, ProfileEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    return profileRemoteDataSource.getCurrentUser();
  }

  @override
  Future<Either<Failure, bool>> updateUserProfile(ProfileEntity profile) {
    // TODO: implement updateUserProfile
    throw profileRemoteDataSource.updateUserProfile(profile);
  }

}