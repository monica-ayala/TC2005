import 'package:dartz/dartz.dart';
import 'package:yolotl/features/home/domain/entities/message.dart';

import '../../../../core/error/failure.dart';

abstract class BotRepository {
  Future<Either<Failure, String>> getCompletion({
    required String text,
    required String userId,
  });
  Future<Either<Failure, List<Message>>> getChat({
    required String userId,
  });
}
