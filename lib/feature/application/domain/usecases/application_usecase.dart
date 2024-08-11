import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/domain/repository/application_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';

class ApplicationUseCase{
  final IApplicationRepository applicationRepository;
  final UserSharedPrefs userSharedPrefs;
  ApplicationUseCase({
    required this.applicationRepository,
    required this.userSharedPrefs
  });

  Future<Either<Failure, bool>> createApplication(ApplicationEntity? application) async {
    return await applicationRepository.createApplication(application!);
  }
}