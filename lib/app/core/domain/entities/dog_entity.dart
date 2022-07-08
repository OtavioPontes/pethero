import 'package:pethero/app/core/domain/entities/animal_entity.dart';

class Dog extends Animal {
  const Dog({
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
}
