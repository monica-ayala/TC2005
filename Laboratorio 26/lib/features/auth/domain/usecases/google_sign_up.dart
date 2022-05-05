import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/usecases/usecase.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GoogleSignUp implements UseCase<User, GoogleSignUpParams> {
  final UserRepository repository;

  GoogleSignUp(this.repository);

  @override
  Future<Either<Failure, User>> call(GoogleSignUpParams params) async {
    return await repository.googleSignUp(
      token: params.token,
    );
  }
}

class GoogleSignUpParams extends Equatable {
  final String token;

  const GoogleSignUpParams({
    required this.token,
  });

  @override
  List<Object> get props => [
        token,
      ];

  @override
  bool get stringify => false;
}
