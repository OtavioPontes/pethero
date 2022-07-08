import 'dart:convert';

import 'package:pethero/app/core/domain/entities/dog_entity.dart';

import '../../domain/entities/dog_entity.dart';

class DogModel extends Dog {
  const DogModel({
    required String name,
    required String country,
    required String lifeSpan,
    required String weight,
    required String temperament,
    String? imageUrl,
  }) : super(
          name: name,
          country: country,
          lifeSpan: lifeSpan,
          weight: weight,
          temperament: temperament,
          imageUrl: imageUrl,
        );
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'country': country,
      'lifeSpan': lifeSpan,
      'weight': weight,
      'temperament': temperament,
      'imageUrl': imageUrl,
    };
  }

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      name: map['name'] ?? '',
      country: map['origin'] ?? '',
      lifeSpan: map['life_span'] ?? '',
      weight: map['weight']['metric'] ?? '',
      temperament: map['temperament'] ?? '',
      imageUrl: map['image']['url'],
    );
  }
  factory DogModel.fromEntity(Dog dog) {
    return DogModel(
      name: dog.name,
      country: dog.country,
      imageUrl: dog.imageUrl,
      lifeSpan: dog.lifeSpan,
      temperament: dog.temperament,
      weight: dog.temperament,
    );
  }

  Dog toEntity() {
    return Dog(
      name: name,
      country: country,
      lifeSpan: lifeSpan,
      weight: weight,
      temperament: temperament,
      imageUrl: imageUrl,
    );
  }

  String toJson() => json.encode(toMap());

  factory DogModel.fromJson(String source) =>
      DogModel.fromMap(json.decode(source));
}
