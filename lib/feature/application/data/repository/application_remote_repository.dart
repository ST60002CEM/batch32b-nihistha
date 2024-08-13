import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/domain/repository/application_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_source/remote/application_remote_data_source.dart';

final applicationRemoteRepositoryProvider = Provider<IApplicationRepository>((ref) =>
    ApplicationRemoteRepository(
        applicationRemoteDataSource: ref.watch(applicationRemoteDataSourceProvider)
    ));

class ApplicationRemoteRepository extends IApplicationRepository{

  final ApplicationRemoteDataSource applicationRemoteDataSource;

  ApplicationRemoteRepository({
    required this.applicationRemoteDataSource
});
  @override
  Future<Either<Failure, bool>> createApplication(ApplicationEntity? application) {
    // TODO: implement createApplication
    return applicationRemoteDataSource.createApplication(application!);
  }

  @override
  Future<Either<Failure, List<ApplicationEntity>>> getUserApplication() {
    return applicationRemoteDataSource.getUserApplications();
  }

  @override
  Future<Either<Failure, String>> deleteApplication(String id) {
    // TODO: implement deleteApplication
    return applicationRemoteDataSource.deleteApplication(id);
  }

  @override
  Future<Either<Failure, bool>> updateApplication(ApplicationEntity application) {
    return applicationRemoteDataSource.updateApplication(application);
  }
}