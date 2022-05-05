import 'package:yolotl/features/home/domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel({
    required String uid,
    required String from,
    required String to,
    required String text,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          from: from,
          to: to,
          text: text,
          createdAt: createdAt,
          uid: uid,
          updatedAt: updatedAt,
        );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        uid: json["_id"],
        from: json["from"],
        to: json["to"],
        text: json["text"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": uid,
        "from": from,
        "to": to,
        "text": text,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
