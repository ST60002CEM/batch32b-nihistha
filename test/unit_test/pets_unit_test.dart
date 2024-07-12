import 'package:adoptapet/feature/pets_listing/domain/usecase/pet_listing_usecase.dart';
import 'package:adoptapet/feature/pets_listing/presentation/view_model/pet_listing_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'pets_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PetListingUseCase>()
])

void main(){
  late PetListingUseCase mockPetListingUseCase;
  late ProviderContainer container;

  setUp((){
    mockPetListingUseCase = MockPetListingUseCase();
    TestWidgetsFlutterBinding.ensureInitialized();

    container = ProviderContainer(
        overrides: [
          petListingViewModelProvider.overrideWith(
                  (ref)=>PetListingViewModel( mockPetListingUseCase)
          )
        ]
    );
  });

  tearDown(
          (){
        container.dispose();
      }
  );
}