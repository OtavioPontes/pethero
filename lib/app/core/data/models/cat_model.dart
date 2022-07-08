import 'dart:convert';

import 'package:pethero/app/core/domain/entities/cat_entity.dart';

class CatModel extends Cat {
  CatModel({
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

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      name: map['name'] ?? '',
      country: map['origin'] ?? '',
      lifeSpan: map['life_span'] ?? '',
      weight: map['weight']['metric'] ?? '',
      temperament: map['temperament'] ?? '',
      imageUrl: map['image']?['url'],
    );
  }
  factory CatModel.fromEntity(Cat cat) {
    return CatModel(
      name: cat.name,
      country: cat.country,
      imageUrl: cat.imageUrl,
      lifeSpan: cat.lifeSpan,
      temperament: cat.temperament,
      weight: cat.temperament,
    );
  }

  Cat toEntity() {
    return Cat(
      name: name,
      country: country,
      lifeSpan: lifeSpan,
      weight: weight,
      temperament: temperament,
      imageUrl: imageUrl,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatModel.fromJson(String source) =>
      CatModel.fromMap(json.decode(source));
}
