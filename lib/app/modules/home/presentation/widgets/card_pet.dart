import 'package:flutter/material.dart';

import 'package:pethero/app/core/extensions/screen_extension.dart';

import '../../../../core/domain/entities/animal_entity.dart';

class CardPet extends StatelessWidget {
  final Animal animal;
  const CardPet({
    Key? key,
    required this.animal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      color: theme.canvasColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.scale,
          vertical: 16.scale,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: theme.backgroundColor,
              backgroundImage: animal.imageUrl != null
                  ? NetworkImage(animal.imageUrl!)
                  : null,
            ),
            SizedBox(width: 16.scale),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.name,
                    style: theme.textTheme.bodyText1!.merge(
                      TextStyle(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.scale),
                  Text(
                    'Peso: ${animal.weight} kg',
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ),
            IgnorePointer(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
