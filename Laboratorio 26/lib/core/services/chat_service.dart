import 'package:http/http.dart' as http;
import 'package:yolotl/core/global/environment.dart';
import 'package:yolotl/features/home/data/models/messages_response.dart';
import 'package:yolotl/features/home/domain/entities/message.dart';

class ChatService {
  final uri = Environment.apiUrl;

  Future<List<Message>> getChat(String userId) async {
    final endPoint = Uri.https(uri, 'api/v1/messages/$userId');

    try {
      final response = await http.get(endPoint, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        final messagesResponse = messagesResponseFromJson(response.body);
        return messagesResponse.mensajes;
      } else {
        throw [];
      }
    } catch (e) {
      return [];
    }
  }
}
