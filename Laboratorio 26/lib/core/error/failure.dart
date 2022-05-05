import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General Failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class RegisterFailure extends Failure {}

class EmailFailure extends Failure {}

class PasswordFailure extends Failure {}

class InactiveFailure extends Failure {}
