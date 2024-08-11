import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class IApplicationRepository{
  Future<Either<Failure, bool>> createApplication(ApplicationEntity? application);
}