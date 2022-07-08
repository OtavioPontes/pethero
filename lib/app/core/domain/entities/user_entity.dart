import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String nome;
  const User({
    required this.email,
    required this.nome,
  });

  @override
  List<Object> get props => [email, nome];

  User copyWith({
    String? email,
    String? nome,
  }) {
    return User(
      email: email ?? this.email,
      nome: nome ?? this.nome,
    );
  }
}
