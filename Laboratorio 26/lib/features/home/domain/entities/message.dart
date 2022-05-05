import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String uid;
  final String from;
  final String to;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Message({
    required this.uid,
    required this.from,
    required this.to,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        uid,
        from,
        to,
        text,
        createdAt,
        updatedAt,
      ];

  @override
  bool get stringify => false;
}
