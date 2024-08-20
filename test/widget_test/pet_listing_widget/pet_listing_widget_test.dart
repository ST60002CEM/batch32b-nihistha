import 'dart:io';

import 'package:adoptapet/feature/pet_details/presentation/navigator/pet_details_navigator.dart';
import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';
import 'package:adoptapet/feature/pets_listing/domain/usecase/pet_listing_usecase.dart';
import 'package:adoptapet/feature/pets_listing/presentation/navigator/pet_listing_navigator.dart';
import 'package:adoptapet/feature/pets_listing/presentation/view/pet_listing_view.dart';
import 'package:adoptapet/feature/pets_listing/presentation/view_model/pet_listing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../unit_test/pets_unit_test.mocks.dart';
import '../../unit_test/test_data/pets_test_data.dart';
import 'pet_listing_widget_test.mocks.dart';


@GenerateNiceMocks([MockSpec<PetListingNavigator>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PetListingUseCase mockPetListingUseCase;
  late PetListingNavigator petListingNavigator;
  late PetDetailsNavigator mockPetDetailsNavigator;
  late List<PetsListingEntity> lstProjects;

  // setUpAll(() => );
  setUp(() {
    HttpOverrides.global = null;
    mockPetListingUseCase = MockPetListingUseCase();
    // mockPetDetailsNavigator = MockPetDetailsNavigator();
    lstProjects = PetsTestData.getPetsTestData();
    petListingNavigator = MockPetListingNavigator();
  });

  testWidgets('Get all pet listing', (tester) async {
    // Mock getAllReviews first
    when(mockPetListingUseCase.getPetListings(1))
        .thenAnswer((_) async => Right(lstProjects));

    // Build our app and trigger a frame.
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            petListingViewModelProvider.overrideWith(
                  (ref) => PetListingViewModel(petListingNavigator,
                       mockPetListingUseCase,
                       ),
            ),
          ],
          child: const MaterialApp(
            home: PetListingView(),
          ),
        ),
      );
    });

    // Wait for the initial getAllReviews call to complete
    await tester.pumpAndSettle();

    expect(find.text('Buddy'), findsOneWidget);
  });

  // testWidgets('Get project detail', (tester) async {
  //   final testProjectDetail = ProjectDetailEntity(
  //       project: const ProjectModel(
  //           projectTitle: "Project Title",
  //           projectDescription: "hi",
  //           projectGoal: 10000,
  //           projectDeadline: "2012-12-11",
  //           projectCategory: "tech"),
  //       investors: [
  //         InvestorModel(
  //             projectId: "abcd",
  //             investorId: RetrievedUser(username: "Prasanna"),
  //             investedAmount: 100)
  //       ],
  //       reviewsCount: 100);
  //
  //   // Stub the getProjectDetail method for 'abcd'
  //   when(mockProjectUseCase.getProjectDetail("abcd"))
  //       .thenAnswer((_) async => Right(testProjectDetail));

    // Build our app and trigger a frame.
  //   await mockNetworkImagesFor(() async {
  //     await tester.pumpWidget(
  //       ProviderScope(
  //         overrides: [
  //           projectDetailViewModelProvider.overrideWith(
  //                 (ref) => ProjectDetailViewModel(
  //                 projectUseCase: mockProjectUseCase,
  //                 projectDetailNavigator: mockProjectDetailViewNavigator),
  //           ),
  //         ],
  //         child: const MaterialApp(
  //           home: ProjectDetailView(
  //             projectId: "abcd",
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  //
  //   // Wait for the initial getAllReviews call to complete
  //   await tester.pumpAndSettle();
  //
  //   expect(find.text('Project Title'), findsOneWidget);
  // });

}