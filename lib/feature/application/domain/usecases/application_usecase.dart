import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import 'package:adoptapet/feature/application/domain/repository/application_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';

class ApplicationUseCase{
  final IApplicationRepository applicationRepository;
  final UserSharedPrefs userSharedPrefs;
  ApplicationUseCase({
    required this.applicationRepository,
    required this.userSharedPrefs
  });

  Future<Either<Failure, bool>> createApplication(ApplicationEntity? application,String petId) async {
    final tokenResult = await userSharedPrefs.getUserToken();

    return tokenResult.fold(
            (failure) => Left(Failure(error: 'Failed to retrieve user token', statusCode: '401')),
            (token) async {
          if (token == null || token.isEmpty) {
            return Left(Failure(error: 'User not logged in', statusCode: '401'));
          }

          // Here you might want to decode the token to get the userId
          // For this example, let's assume the token is the userId
          final userId = token;

          // Create a new ApplicationEntity with userId and petId
          final updatedApplication = ApplicationEntity(
            appid: application?.appid ?? '', // Provide a default value if null
            userId: userId,
            petId: petId,
            name: application?.name ?? '',
            email: application?.email ?? '',
            phonenumber: application?.phonenumber ?? '',
            age: application?.age ?? 0,
            address: application?.address ?? '',
            occupation: application?.occupation ?? '',
            livingSituation: application?.livingSituation ?? '',
            reasonsForAdopting: application?.reasonsForAdopting ?? '',
            haveDog: application?.haveDog ?? false,
          );

          // Call the repository method
          try {
            final result = await applicationRepository.createApplication(updatedApplication,petId);
            return result.fold(
                    (failure) => Left(failure),
                    (success) => Right(success)
            );
          } catch (e) {
            return Left(Failure(error: 'An unexpected error occurred: $e', statusCode: '500'));
          }
        }
    );
  }
}