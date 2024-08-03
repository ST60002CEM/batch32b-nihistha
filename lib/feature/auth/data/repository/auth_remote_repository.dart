import 'package:adoptapet/core/error/failure.dart';
import 'package:adoptapet/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:adoptapet/feature/auth/domain/entity/auth_entity.dart';
import 'package:adoptapet/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});
class AuthRemoteRepository implements IAuthRepository{
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    // TODO: implement loginUser
    return _authRemoteDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    // TODO: implement registerUser
    return _authRemoteDataSource.registerUser(user);
  }
}