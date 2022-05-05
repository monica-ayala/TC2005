import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.uid,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        uid,
        name,
        email,
        createdAt,
        updatedAt,
      ];

  @override
  bool get stringify => false;
}
