// Mocks generated by Mockito 5.4.4 from annotations
// in adoptapet/test/unit_test/profile_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:adoptapet/core/error/failure.dart' as _i5;
import 'package:adoptapet/feature/profile/domain/entity/profile_entity.dart'
    as _i6;
import 'package:adoptapet/feature/profile/domain/repository/profile_repository.dart'
    as _i3;
import 'package:adoptapet/feature/profile/domain/usecase/profile_usecase.dart'
    as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIProfileRepository_1 extends _i1.SmartFake
    implements _i3.IProfileRepository {
  _FakeIProfileRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IProfileRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIProfileRepository extends _i1.Mock
    implements _i3.IProfileRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>> getCurrentUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.ProfileEntity>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.ProfileEntity>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> updateUserProfile(
          _i6.ProfileEntity? profile) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserProfile,
          [profile],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #updateUserProfile,
            [profile],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #updateUserProfile,
            [profile],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}

/// A class which mocks [ProfileUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileUsecase extends _i1.Mock implements _i7.ProfileUsecase {
  @override
  _i3.IProfileRepository get profileRepository => (super.noSuchMethod(
        Invocation.getter(#profileRepository),
        returnValue: _FakeIProfileRepository_1(
          this,
          Invocation.getter(#profileRepository),
        ),
        returnValueForMissingStub: _FakeIProfileRepository_1(
          this,
          Invocation.getter(#profileRepository),
        ),
      ) as _i3.IProfileRepository);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>> getCurrentUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.ProfileEntity>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.ProfileEntity>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.ProfileEntity>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> updateUserProfile(
          _i6.ProfileEntity? profile) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserProfile,
          [profile],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #updateUserProfile,
            [profile],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #updateUserProfile,
            [profile],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
