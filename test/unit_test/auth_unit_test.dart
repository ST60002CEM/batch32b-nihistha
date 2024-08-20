import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/auth/domain/entity/auth_entity.dart';
import 'package:adoptapet/feature/auth/domain/usecases/auth_usecases.dart';
import 'package:adoptapet/feature/auth/presentation/navigator/login_navigator.dart';
import 'package:adoptapet/feature/auth/presentation/view_model/auth_view_model.dart';
import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:adoptapet/feature/pet_details/domain/repository/pet_details_repository.dart';
import 'package:adoptapet/feature/pet_details/domain/usecase/pet_details_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
  MockSpec<IPetDetailsRepository>(),
])

void main(){

  late AuthUseCase mockAuthUsecase;
  late LoginViewNavigator mockLoginViewNavigator;
  late ProviderContainer container;

  setUp((){
    mockAuthUsecase = MockAuthUseCase();
    mockLoginViewNavigator= MockLoginViewNavigator();
    TestWidgetsFlutterBinding.ensureInitialized();

    container = ProviderContainer(
        overrides: [
          authViewModelProvider.overrideWith(
                  (ref)=>AuthViewModel(mockLoginViewNavigator,mockAuthUsecase)
          )
        ]
    );
  });



  test('check for the initial state in Auth State',(){
    final authState = container.read(authViewModelProvider);
    expect (authState.isLoading,false);
    expect (authState.error,isNull);
  });

  test('login test with valid username and password',() async{
    const correctEmail = 'nihira@gmail.com';
    const correctPassword = '1234567890';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          email == correctEmail && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Invalid')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('nihira@gmail.com', '1234567890');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);

  });

  test('login test with invalid username and password', () async {
    // Arrange
    const correctUsername = 'nihira@gmail.com';
    const correctPassword = '1234567890';
    const invalidUsername = 'nihira@gmail.com';
    const invalidPassword = 'wrongpassword';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          username == correctUsername && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Invalid credentials')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser(invalidUsername, invalidPassword);
    final authState = container.read(authViewModelProvider);

    expect(authState.error, isNull);
    expect(authState.isLoading, true);
  });

  test('register test with valid user information', () async {
    const validUser = AuthEntity(
        fullname: 'Nihira Shrestha',
        email: 'nihira@example.com',
        password: 'abcde123',
        phonenumber: "981237121");

    when(mockAuthUsecase.registerUser(any))
        .thenAnswer((_) async => const Right(true));

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .registerUser(validUser);
    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('register test fails when username is empty', () async {
    const invalidUser = AuthEntity(
        fullname: 'Nihira SHrestha', // Invalid: Empty username
        email: '',
        password: 'abcde123',
        phonenumber: "981237123");

    // Mock the use case to check username and return a failure if it's empty
    when(mockAuthUsecase.registerUser(any)).thenAnswer((invocation) async {
      final user = invocation.positionalArguments[0] as AuthEntity;
      if (user.email.isEmpty) {
        return Left(Failure(error: 'Username cannot be empty'));
      }
      return const Right(true);
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .registerUser(invalidUser);

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });
  group("pet testcases", (){
    late PetDetailsUseCase petDetailUsecase;
    late MockIPetDetailsRepository mockPetDetailsRepository;

    setUp(() {
      mockPetDetailsRepository = MockIPetDetailsRepository();
      petDetailUsecase = PetDetailsUseCase(
          petDetailsRepository: mockPetDetailsRepository);
    });

    final tProductId = '123';
    final tProductDetail = PetDetailsEntity(
      petid: tProductId,
      petName: 'Test Product',
      petType: "cat",
      aboutPet: 'Test Description',
      breed: 'Test Category',
      size: 'Test size',
      petImage: 'http://example.com/image.jpg',
      gender: "male"
    );
    test('should get product details from the repository', () async {
      // Arrange
      when(mockPetDetailsRepository.getPetDetails(any))
          .thenAnswer((_) async => Right(tProductDetail));

      // Act
      final result = await petDetailUsecase.getPetDetails(tProductId);

      // Assert
      expect(result, Right(tProductDetail));
      verify(mockPetDetailsRepository.getPetDetails(tProductId));
      verifyNoMoreInteractions(mockPetDetailsRepository);
    });
  });



  tearDown((){
        container.dispose();
      }
  );
}