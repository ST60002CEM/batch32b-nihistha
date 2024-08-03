import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';
import 'package:adoptapet/feature/pets_listing/domain/usecase/pet_listing_usecase.dart';
import 'package:adoptapet/feature/pets_listing/presentation/view_model/pet_listing_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pets_unit_test.mocks.dart';
import 'test_data/pets_test_data.dart';

@GenerateNiceMocks([
  MockSpec<PetListingUseCase>()
])

void main(){
  late PetListingUseCase mockPetListingUseCase;
  late ProviderContainer container;
  late List<PetsListingEntity> lstProjects;

  setUp((){
    mockPetListingUseCase = MockPetListingUseCase();
    TestWidgetsFlutterBinding.ensureInitialized();
    lstProjects = PetsTestData.getPetsTestData();
        container = ProviderContainer(overrides: [
          petListingViewModelProvider.overrideWith(
                  (ref) => PetListingViewModel(petListingUseCase: mockPetListingUseCase))
        ]);
  });

  test('Fetch products ', () async {
    when(mockPetListingUseCase.getPetListings(1))
        .thenAnswer((_) async => Right(lstProjects));

    // Fetch products
    await container.read(petListingViewModelProvider.notifier).getPetListings();

    // Store the state
    final petListingState = container.read(petListingViewModelProvider);

    // Check the state
    expect(petListingState.isLoading, equals(false));
    expect(petListingState.petListings, equals(lstProjects));
  });
  tearDown(
          (){
        container.dispose();
      }
  );
}