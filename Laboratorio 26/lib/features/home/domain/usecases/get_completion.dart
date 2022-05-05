import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/usecases/usecase.dart';
import 'package:yolotl/features/home/domain/repositories/bot_repository.dart';

class GetCompletion implements UseCase<String, GetCompletionParams> {
  final BotRepository repository;

  GetCompletion(this.repository);

  @override
  Future<Either<Failure, String>> call(GetCompletionParams params) async {
    return await repository.getCompletion(
      text: params.text,
      userId: params.userId,
    );
  }
}

class GetCompletionParams extends Equatable {
  final String text;
  final String userId;

  const GetCompletionParams({
    required this.text,
    required this.userId,
  });

  @override
  List<Object> get props => [
        text,
        userId,
      ];

  @override
  bool get stringify => false;
}
