import 'package:adoptapet/feature/auth/domain/usecases/auth_usecases.dart';
import 'package:adoptapet/feature/auth/presentation/navigator/login_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
])

void main(){
  late AuthUseCase mockAuthUsecase;
  late LoginViewNavigator mockLoginViewNavigator;
  late ProviderContainer container;
}