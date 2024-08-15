import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/meet/domain/entity/meet_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/remote/meet_remote_repository.dart';

final meetRepositoryProvider = Provider<IMeetRepository>((ref) {
  return ref.read(meetRemoteRepositoryProvider);
});

abstract class IMeetRepository{
  Future<Either<Failure,bool>> scheduleMeet(MeetEntity meet);
}