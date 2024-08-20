import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:adoptapet/feature/user_applications/domain/entity/user_application_entity.dart';

class UserApplicationState{
  final bool isLoading;
  final String? error;
  final List<UserApplicationEntity> userApplication;


  UserApplicationState(
  {required this.isLoading,
  this.error,
  required this.userApplication,
  });

  factory UserApplicationState.initial() => UserApplicationState(
  isLoading: false,
  error: null,
  userApplication: []
  );

  UserApplicationState copyWith(
  {bool? isLoading,
  String? error,
  List<UserApplicationEntity>? userApplication,
  }) {
  return UserApplicationState(
  isLoading: isLoading ?? this.isLoading,
      userApplication: userApplication ?? this.userApplication,
  error: error ?? this.error,
      );
  }

  @override
  String toString() =>
  'UserApplicationState(isLoading: $isLoading, error: $error,userApplication:$userApplication)';

}