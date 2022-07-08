import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pethero/app/core/extensions/screen_extension.dart';
import 'package:pethero/app/core/stores/animal_store.dart';
import 'package:pethero/app/core/style/assets.dart';

import '../../../../../../core/domain/entities/dog_entity.dart';
import '../../../../../details/details_module.dart';

class DogsPage extends StatelessWidget {
  const DogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimalStore controller = Modular.get<AnimalStore>();
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24.scale, bottom: 32.scale),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.scale),
                child: IconButton(
                  onPressed: Modular.to.pop,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.scale),
            Padding(
              padding: EdgeInsets.only(left: 48.scale, right: 16.scale),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'dog',
                    child: SvgPicture.asset(
                      AssetsPetHero.dog,
                    ),
                  ),
                  SizedBox(width: 24.scale),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Doguinhos',
                          style: theme.textTheme.headline4!.merge(
                            TextStyle(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.scale),
                        Text(
                          'Os Melhores Amigos do Homem',
                          style: theme.textTheme.caption!.merge(
                            TextStyle(
                              color: theme.disabledColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.scale),
            Observer(builder: (_) {
              return Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.backgroundColor,
                ),
                child: ListView.builder(
                  itemCount: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.scale,
                    vertical: 16.scale,
                  ),
                  itemBuilder: (context, index) {
                    final Dog dog = controller.listDogs[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.scale,
                      ),
                      child: InkWell(
                        onTap: () => Modular.to.pushNamed(
                          DetailsModule.routeName,
                          arguments: {
                            'animal': dog,
                            'hasIcon': true,
                          },
                        ),
                        child: Card(
                          color: theme.canvasColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.scale,
                              vertical: 16.scale,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Hero(
                                  tag: 'animal',
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: theme.backgroundColor,
                                    backgroundImage: dog.imageUrl != null
                                        ? NetworkImage(dog.imageUrl!)
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 16.scale),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dog.name,
                                        style: theme.textTheme.bodyText1!.merge(
                                          TextStyle(
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.scale),
                                      Text(
                                        'Peso: ${dog.weight} kg',
                                        style: theme.textTheme.caption,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
