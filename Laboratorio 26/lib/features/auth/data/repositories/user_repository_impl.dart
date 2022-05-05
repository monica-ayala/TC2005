import 'package:yolotl/core/error/exceptions.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yolotl/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, User>> userIsLoggedIn() async {
    try {
      final remoteUser = await remoteDataSource.userIsLoggedIn();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final remoteUser = await remoteDataSource.userLogin(
        email: email,
        password: password,
      );
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } on EmailException {
      return Left(EmailFailure());
    } on PasswordException {
      return Left(PasswordFailure());
    } on InactiveException {
      return Left(InactiveFailure());
    }
  }

  @override
  Future<Either<Failure, User>> userRegister({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final remoteUser = await remoteDataSource.userRegister(
        email: email,
        password: password,
        name: name,
      );
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } on RegisterException {
      return Left(RegisterFailure());
    }
  }

  @override
  Future<Either<Failure, User>> googleSignIn({required String token}) async {
    try {
      final remoteUser = await remoteDataSource.googleSignIn(token: token);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } on EmailException {
      return Left(EmailFailure());
    } on PasswordException {
      return Left(PasswordFailure());
    } on InactiveException {
      return Left(InactiveFailure());
    }
  }

  @override
  Future<Either<Failure, User>> googleSignUp({required String token}) async {
    try {
      final remoteUser = await remoteDataSource.googleSignUp(token: token);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } on RegisterException {
      return Left(RegisterFailure());
    }
  }
}
