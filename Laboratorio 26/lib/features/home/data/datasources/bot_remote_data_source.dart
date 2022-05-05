import 'dart:convert';
import 'dart:developer';

import 'package:yolotl/core/error/exceptions.dart';
import 'package:yolotl/core/global/environment.dart';
import 'package:yolotl/features/home/data/models/completion_response.dart';
import 'package:http/http.dart' as http;
import 'package:yolotl/features/home/data/models/message_model.dart';
import 'package:yolotl/features/home/data/models/messages_response.dart';

abstract class BotRemoteDataSource {
  Future<String> getCompletion({
    required String text,
    required String userId,
  });

  Future<List<MessageModel>> getChat({
    required String userId,
  });
}

class BotRemoteDataSourceImpl implements BotRemoteDataSource {
  BotRemoteDataSourceImpl({required this.client});
  final http.Client client;
  final uri = Environment.apiUrl;

  @override
  Future<String> getCompletion(
      {required String text, required String userId}) async {
    final endPoint = Uri.https(uri, 'api/v1/bot');

    final Map<String, String> data = <String, String>{
      'text': text,
      'userId': userId,
    };

    log(data.toString());

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    log(response.body);

    if (response.statusCode == 200) {
      final completionResponse = completionResponseFromJson(response.body);

      return completionResponse.data.choices[0].text
          .trim()
          .replaceAll("Ajolote: ", "");
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MessageModel>> getChat({required String userId}) async {
    final endPoint = Uri.https(uri, 'api/v1/messages/$userId');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    log(response.body);

    if (response.statusCode == 200) {
      final messagesResponse = messagesResponseFromJson(response.body);
      return messagesResponse.mensajes;
    } else {
      throw ServerException();
    }
  }
}
