import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/domain/repository/application_repository.dart';
import 'package:adoptapet/feature/user_applications/domain/entity/user_application_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../repository/IUserApplicationRepository.dart';

final userApplicationUseCaseProvider =
Provider<UserApplicationUseCase>((ref) => UserApplicationUseCase(
  userApplicationRepository: ref.read(userApplicationRepositoryProvider),
  userSharedPrefs: ref.watch(userSharedPrefsProvider),
));

class UserApplicationUseCase{
  final IUserApplicationRepository userApplicationRepository;
  final UserSharedPrefs userSharedPrefs;
  UserApplicationUseCase({
    required this.userApplicationRepository,
    required this.userSharedPrefs
  });
  Future<Either<Failure, List<UserApplicationEntity>>> getUserApplication() async {
    return await userApplicationRepository.getUserApplicationandDetails();
  }
}