
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/usecases/usecase.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/repositories/user_repository.dart';

class UserRegister implements UseCase<User, UserRegisterParams> {
  final UserRepository repository;

  UserRegister(this.repository);

  @override
  Future<Either<Failure, User>> call(UserRegisterParams params) async {
    return await repository.userRegister(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class UserRegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;

  const UserRegisterParams({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [
        email,
        password,
        name,
      ];

  @override
  bool get stringify => false;
}
