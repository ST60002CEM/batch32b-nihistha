import 'package:adoptapet/feature/meet/domain/entity/meet_entity.dart';
import 'package:adoptapet/feature/meet/domain/repository/meet_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';

final meetUsevaseProvider = Provider((ref) {
  return MeetUsecase(ref.read(meetRepositoryProvider));
});

class MeetUsecase{
  final IMeetRepository _meetRepository;
  MeetUsecase(this._meetRepository);

  Future<Either<Failure, bool>> scheduleMeet(MeetEntity? meet) async {
    return await _meetRepository.scheduleMeet(meet!);
  }
}