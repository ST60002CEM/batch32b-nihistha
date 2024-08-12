import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../data/repository/profile_remote_repository.dart';
import '../entity/profile_entity.dart';

final profileRepositoryProvider = Provider<IProfileRepository>((ref) {
  return ref.read(profileRemoteRepositoryProvider);
});

abstract class IProfileRepository{
  Future<Either<Failure,ProfileEntity>>getCurrentUser();
}