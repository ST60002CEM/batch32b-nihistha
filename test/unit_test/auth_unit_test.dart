import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/auth/domain/usecases/auth_usecases.dart';
import 'package:adoptapet/feature/auth/presentation/navigator/login_navigator.dart';
import 'package:adoptapet/feature/auth/presentation/view_model/auth_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
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

  tearDown(
          (){
        container.dispose();
      }
  );


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
}