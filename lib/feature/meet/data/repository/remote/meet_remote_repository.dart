import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/meet/data/data_source/meet_remote_data_source.dart';
import 'package:adoptapet/feature/meet/domain/entity/meet_entity.dart';
import 'package:adoptapet/feature/meet/domain/repository/meet_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final meetRemoteRepositoryProvider = Provider<IMeetRepository>((ref) =>
    MeetRemoteRepository(
        meetRemoteDataSource: ref.watch(meetRemoteDataSourceProvider)
    ));

class MeetRemoteRepository extends IMeetRepository{

  final MeetRemoteDataSource meetRemoteDataSource;
  MeetRemoteRepository({required this.meetRemoteDataSource});
  @override
  Future<Either<Failure, bool>> scheduleMeet(MeetEntity meet) {
    // TODO: implement scheduleMeet
    return meetRemoteDataSource.scheduleMeet(meet);
  }

}