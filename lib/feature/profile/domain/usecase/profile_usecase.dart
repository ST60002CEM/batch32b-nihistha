import 'package:adoptapet/feature/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../entity/profile_entity.dart';

final profileUsecaseProvider = Provider(
      (ref) => ProfileUsecase(
    profileRepository: ref.read(profileRepositoryProvider),
  ),
);

class ProfileUsecase{
  final IProfileRepository profileRepository;
  ProfileUsecase({required this.profileRepository});
  Future<Either<Failure, ProfileEntity>> getCurrentUser() async {
    return await profileRepository.getCurrentUser();
  }
}