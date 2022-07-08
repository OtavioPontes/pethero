import 'dart:convert';

import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  final String name;
  final String country;
  final String lifeSpan;
  final String weight;
  final String temperament;
  final String? imageUrl;
  const Animal({
    required this.name,
    required this.country,
    required this.lifeSpan,
    required this.weight,
    required this.temperament,
    this.imageUrl,
  });

  @override
  List<Object?> get props {
    return [
      name,
      country,
      lifeSpan,
      weight,
      temperament,
      imageUrl,
    ];
  }

  Animal copyWith({
    String? name,
    String? country,
    String? lifeSpan,
    String? weight,
    String? temperament,
    String? imageUrl,
  }) {
    return Animal(
      name: name ?? this.name,
      country: country ?? this.country,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      weight: weight ?? this.weight,
      temperament: temperament ?? this.temperament,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
