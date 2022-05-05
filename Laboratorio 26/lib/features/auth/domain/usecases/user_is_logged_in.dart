import 'package:dartz/dartz.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/usecases/usecase.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/repositories/user_repository.dart';

class UserIsLoggedIn implements UseCase<User, NoParams> {
  final UserRepository repository;

  UserIsLoggedIn(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.userIsLoggedIn();
  }
}
