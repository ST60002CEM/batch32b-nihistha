import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/profile/domain/entity/profile_entity.dart';
import 'package:adoptapet/feature/profile/domain/repository/profile_repository.dart';
import 'package:adoptapet/feature/profile/domain/usecase/profile_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IProfileRepository>(),
  MockSpec <ProfileUsecase>()
])
void main() {
  late MockIProfileRepository mockProfileRepository;
  late ProfileUsecase profileUsecase;
  late ProfileUsecase mockProfileUsecase;

  setUp(() {
    mockProfileRepository = MockIProfileRepository();
    profileUsecase = ProfileUsecase(profileRepository: mockProfileRepository);
  });

  group('ProfileUsecase', () {
    test('should return ProfileEntity on successful fetch', () async {
      const profileEntity = ProfileEntity(
          id: '1',
          fullname: 'Nihira Shrestha',
          email: 'nihira@example.com',
          phonenumber: '9898898998'
      );

      when(mockProfileRepository.getCurrentUser())
          .thenAnswer((_) async => const Right(profileEntity));

      final result = await profileUsecase.getCurrentUser();

      expect(result, const Right(profileEntity));
      verify(mockProfileRepository.getCurrentUser()).called(1);
    });
});
}