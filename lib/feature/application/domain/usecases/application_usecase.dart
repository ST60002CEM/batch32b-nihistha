import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/domain/repository/application_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class ApplicationUseCase{
  final IApplicationRepository applicationRepository;
  ApplicationUseCase({
    required this.applicationRepository
  });

  Future<Either<Failure, bool>> createApplication(ApplicationEntity? application) async {
    return await applicationRepository.createApplication(application!);
  }
}