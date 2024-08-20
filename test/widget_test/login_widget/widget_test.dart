import 'package:adoptapet/app/navigator_key/navigator_key.dart';
import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/auth/domain/usecases/auth_usecases.dart';
import 'package:adoptapet/feature/auth/presentation/navigator/login_navigator.dart';
import 'package:adoptapet/feature/auth/presentation/view/login_view.dart';
import 'package:adoptapet/feature/auth/presentation/view_model/auth_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../unit_test/auth_unit_test.mocks.dart';


void main() {
  late AuthUseCase mockAuthUsecase;
  late LoginViewNavigator mockLoginViewNavigator;

  setUp(() {
    mockAuthUsecase = MockAuthUseCase();
    mockLoginViewNavigator = MockLoginViewNavigator();
  });

  testWidgets(
      'Login with username and password and check whether home page opens or not',
          (tester) async {
        // Arrange
        const correctUsername = 'prasanna@gmail.com';
        const correctPassword = 'prasanna123';

        when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
          final username = invocation.positionalArguments[0] as String;
          final password = invocation.positionalArguments[1] as String;
          return Future.value(
              username == correctUsername && password == correctPassword
                  ? const Right(true)
                  : Left(Failure(error: 'Invalid Credentails')));
        });

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authViewModelProvider.overrideWith(
                    (ref) => AuthViewModel(
                  ref.read(loginViewNavigatorProvider),
                  mockAuthUsecase,
                ),
              )
            ],
            child: MaterialApp(
              navigatorKey: AppNavigator.navigatorKey,
              debugShowCheckedModeBanner: false,
              home: const LoginView(),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byType(TextFormField).at(0), 'prasanna@gmail.com');
        await tester.enterText(find.byType(TextFormField).at(1), 'prasanna123');

        await tester.tap(
          find.widgetWithText(ElevatedButton, 'Login'),
        );

        // await tester.pumpAndSettle();
        for (int i = 0; i < 5; i++) {
          await tester.pump(const Duration(seconds: 1));
        }
        expect(find.text('Location'), findsOneWidget);
      });
  testWidgets('display error message for incorrect credentials',
          (WidgetTester tester) async {
        const correctEmail = 'wrong@example.com';
        const correctPassword = 'wrong123';

        when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
          final email = invocation.positionalArguments[0] as String;
          final password = invocation.positionalArguments[1] as String;
          return Future.value(
              email != correctEmail && password != correctPassword
                  ? const Right(true)
                  : Left(Failure(error: 'Invalid credentials')));
        });

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authViewModelProvider.overrideWith(
                    (ref) => AuthViewModel(
                  ref.read(loginViewNavigatorProvider),
                  mockAuthUsecase,
                ),
              ),
            ],
            child: MaterialApp(
              navigatorKey: AppNavigator.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Adoptapet',
              home: const LoginView(),
            ),
          ),
        );

        // Wait for the initial build
        await tester.pump();

        // Enter text
        await tester.enterText(
            find.byType(TextFormField).at(0), 'wron@example.com');
        await tester.enterText(find.byType(TextFormField).at(1), 'wrong12');

        // Tap the login button
        await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

        // Pump the widget tree multiple times with a small delay
        for (int i = 0; i < 10; i++) {
          await tester.pump(const Duration(milliseconds: 100));

          // Check if the error message is visible
          if (find.text('Invalid credentials').evaluate().isNotEmpty) {
            break;
          }
        }

        // Verify that the error message is displayed
        expect(find.text('Invalid credentials'), findsOneWidget);

        // Verify that the mock was called with the correct parameters
        verify(mockAuthUsecase.loginUser('wron@example.com', 'wrong12')).called(1);
      });

  // testWidgets('display error messages for empty fields on form submission',
  //         (tester) async {
  //       await tester.pumpWidget(
  //         ProviderScope(
  //           overrides: [
  //             authViewModelProvider.overrideWith(
  //                   (ref) => AuthViewModel(
  //                 ref.read(loginViewNavigatorProvider),
  //                 mockAuthUsecase,
  //               ),
  //             ),
  //           ],
  //           child: MaterialApp(
  //             navigatorKey: AppNavigator.navigatorKey,
  //             debugShowCheckedModeBanner: false,
  //             title: 'Adoptapet',
  //             home: const LoginView(),
  //           ),
  //         ),
  //       );
  //
  //       await tester.pumpAndSettle();
  //
  //       await tester.tap(find.widgetWithText(ElevatedButton, 'Log In'));
  //
  //       await tester.pump();
  //
  //       expect(find.text('Please enter email'), findsOneWidget);
  //       expect(find.text('Please enter password'), findsOneWidget);
  //     });
}

