import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/usecases/usecase.dart';
import 'package:yolotl/features/home/domain/entities/message.dart';
import 'package:yolotl/features/home/domain/repositories/bot_repository.dart';

class GetChat implements UseCase<List<Message>, GetChatParams> {
  final BotRepository repository;

  GetChat(this.repository);

  @override
  Future<Either<Failure, List<Message>>> call(GetChatParams params) async {
    return await repository.getChat(
      userId: params.userId,
    );
  }
}

class GetChatParams extends Equatable {
  final String userId;

  const GetChatParams({
    required this.userId,
  });

  @override
  List<Object> get props => [
        userId,
      ];

  @override
  bool get stringify => false;
}
