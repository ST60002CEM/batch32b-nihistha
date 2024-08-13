import 'package:adoptapet/feature/application/data/repository/application_remote_repository.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';

final applicationRepositoryProvider = Provider<IApplicationRepository>((ref) {
  return ref.read(applicationRemoteRepositoryProvider);
});

abstract class IApplicationRepository{
  Future<Either<Failure, bool>> createApplication(ApplicationEntity? application);
  Future<Either<Failure,List<ApplicationEntity>>> getUserApplication();
  Future<Either<Failure,String>> deleteApplication(String id);
}