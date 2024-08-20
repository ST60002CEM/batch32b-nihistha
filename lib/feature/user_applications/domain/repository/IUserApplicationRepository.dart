import 'package:adoptapet/feature/application/data/repository/application_remote_repository.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../data/repository/remote/user_application_remote_repository.dart';
import '../entity/user_application_entity.dart';

final userApplicationRepositoryProvider = Provider<IUserApplicationRepository>((ref) {
  return ref.read(userApplicationRemoteRepositoryProvider);
});

abstract class IUserApplicationRepository{
  Future<Either<Failure,List<UserApplicationEntity>>> getUserApplicationandDetails();
}