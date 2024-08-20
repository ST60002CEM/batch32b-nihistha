import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/domain/repository/application_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';

final applicationUseCaseProvider =
Provider<ApplicationUseCase>((ref) => ApplicationUseCase(
  applicationRepository: ref.read(applicationRepositoryProvider),
  userSharedPrefs: ref.watch(userSharedPrefsProvider),
));

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
  Future<Either<Failure, List<ApplicationEntity>>> getUserApplication() async {
    return await applicationRepository.getUserApplication();
  }
  Future<Either<Failure,String>>deleteApplication(String id) async{
    return await applicationRepository.deleteApplication(id);
  }
  Future<Either<Failure,bool>>updateApplication(ApplicationEntity application) async{
    return await applicationRepository.updateApplication(application);
  }
}