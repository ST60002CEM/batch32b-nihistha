import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/domain/repository/application_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/data/data_source/remote/application_remote_data_source.dart';
import '../../../domain/entity/user_application_entity.dart';
import '../../../domain/repository/IUserApplicationRepository.dart';
import '../../data_source/user_application_data_source.dart';

final userApplicationRemoteRepositoryProvider = Provider<IUserApplicationRepository>((ref) =>
    UserApplicationRemoteRepository(
        userApplicationRemoteDataSource: ref.watch(userApplicationRemoteDataSourceProvider)
    ));

class UserApplicationRemoteRepository extends IUserApplicationRepository{

  final UserApplicationDataSource userApplicationRemoteDataSource;

  UserApplicationRemoteRepository({
    required this.userApplicationRemoteDataSource
  });


  @override
  Future<Either<Failure, List<UserApplicationEntity>>> getUserApplicationandDetails() {
    return userApplicationRemoteDataSource.getUserApplicationandDetails();
  }

}