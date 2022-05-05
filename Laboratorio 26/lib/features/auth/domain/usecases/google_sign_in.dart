import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/usecases/usecase.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GoogleSignIn implements UseCase<User, GoogleSignInParams> {
  final UserRepository repository;

  GoogleSignIn(this.repository);

  @override
  Future<Either<Failure, User>> call(GoogleSignInParams params) async {
    return await repository.googleSignIn(
      token: params.token,
    );
  }
}

class GoogleSignInParams extends Equatable {
  final String token;

  const GoogleSignInParams({
    required this.token,
  });

  @override
  List<Object> get props => [
        token,
      ];

  @override
  bool get stringify => false;
}
