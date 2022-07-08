import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pethero/app/core/extensions/screen_extension.dart';
import 'package:pethero/app/core/style/assets.dart';

import '../../../../core/domain/entities/animal_entity.dart';
import '../../../../core/domain/entities/cat_entity.dart';

class DetailsPage extends StatelessWidget {
  final Animal animal;
  final bool hasIcon;
  const DetailsPage({
    Key? key,
    required this.animal,
    required this.hasIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 24.scale, bottom: 32.scale),
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.scale),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: Modular.to.pop,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 40,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: 4.scale),
                      if (hasIcon)
                        animal.runtimeType == Cat
                            ? Hero(
                                tag: 'cat',
                                child: SvgPicture.asset(
                                  AssetsPetHero.cat,
                                  height: 50,
                                ),
                              )
                            : Hero(
                                tag: 'dog',
                                child: SvgPicture.asset(
                                  AssetsPetHero.dog,
                                  height: 50,
                                ),
                              ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 120.scale),
              Card(
                color: theme.canvasColor,
                child: Container(
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 56.scale,
                      bottom: 40.scale,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.scale),
                          child: Text(
                            animal.name,
                            style: theme.textTheme.headline5!.merge(
                              TextStyle(
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.scale),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 40.scale,
                            right: 16.scale,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Peso: ',
                                      style: theme.textTheme.headline6!.merge(
                                        TextStyle(
                                          color: theme.colorScheme.onBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 64.scale),
                                  Flexible(
                                    child: Text(
                                      '${animal.weight} Kg',
                                      style: theme.textTheme.headline6!.merge(
                                        TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: theme.colorScheme.onBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.scale),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Origem: ',
                                      style: theme.textTheme.headline6!.merge(
                                        TextStyle(
                                          color: theme.colorScheme.onBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 32.scale),
                                  Flexible(
                                    child: Text(
                                      animal.country.isEmpty
                                          ? '-'
                                          : animal.country,
                                      style: theme.textTheme.headline6!.merge(
                                        TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: theme.colorScheme.onBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.scale),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Tempo de Vida:',
                                      style: theme.textTheme.headline6!.merge(
                                        TextStyle(
                                          color: theme.colorScheme.onBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.scale),
                                  Flexible(
                                    child: Text(
                                      '${animal.lifeSpan} anos',
                                      style: theme.textTheme.headline6!.merge(
                                        TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: theme.colorScheme.onBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.scale),
                              Text(
                                'Temperamento:',
                                style: theme.textTheme.headline6!.merge(
                                  TextStyle(
                                    color: theme.colorScheme.onBackground,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.scale),
                              Text(
                                animal.temperament,
                                style: theme.textTheme.headline6!.merge(
                                  TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: theme.colorScheme.onBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 56.scale,
            child: Container(
              width: 150.scale,
              height: 150.scale,
              decoration: BoxDecoration(
                color: theme.canvasColor,
                shape: BoxShape.circle,
                image: animal.imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(
                          animal.imageUrl!,
                        ),
                        fit: BoxFit.contain,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
