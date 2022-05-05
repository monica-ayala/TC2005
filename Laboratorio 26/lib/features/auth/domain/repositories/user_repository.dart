
import 'package:dartz/dartz.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> userIsLoggedIn();
  Future<Either<Failure, User>> userLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> userRegister({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, User>> googleSignUp({
    required String token,
  });

  Future<Either<Failure, User>> googleSignIn({
    required String token,
  });
}
