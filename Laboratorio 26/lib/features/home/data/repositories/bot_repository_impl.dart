import 'package:yolotl/core/error/exceptions.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/features/home/data/datasources/bot_remote_data_source.dart';
import 'package:yolotl/features/home/domain/entities/message.dart';
import 'package:yolotl/features/home/domain/repositories/bot_repository.dart';
import 'package:dartz/dartz.dart';

class BotRepositoryImpl implements BotRepository {
  final BotRemoteDataSource remoteDataSource;

  BotRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, String>> getCompletion(
      {required String text, required String userId}) async {
    try {
      final remoteData =
          await remoteDataSource.getCompletion(text: text, userId: userId);
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getChat(
      {required String userId}) async {
    try {
      final remoteData = await remoteDataSource.getChat(userId: userId);
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
