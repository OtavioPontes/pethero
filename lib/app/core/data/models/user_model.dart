import 'dart:convert';

import 'package:pethero/app/core/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required String email,
    required String nome,
  }) : super(
          email: email,
          nome: nome,
        );
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': nome,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      nome: map['name'] ?? '',
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      email: user.email,
      nome: user.nome,
    );
  }

  User toEntity() {
    return User(
      email: email,
      nome: nome,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
