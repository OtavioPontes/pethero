import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pethero/app/core/domain/entities/animal_entity.dart';
import 'package:pethero/app/core/extensions/screen_extension.dart';
import 'package:pethero/app/core/stores/user_store.dart';
import 'package:pethero/app/modules/details/details_module.dart';
import 'package:pethero/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pethero/app/modules/home/presentation/widgets/card_pet.dart';
import 'package:pethero/app/modules/home/submodules/cats/cats_module.dart';
import 'package:pethero/app/modules/home/submodules/dogs/dogs_module.dart';

import '../../../../core/style/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = Modular.get<UserStore>();
    final HomeController controller = Modular.get<HomeController>();
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
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.scale),
                child: InkWell(
                  onTap: userStore.logout,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 20.scale,
                        color: theme.colorScheme.onBackground,
                      ),
                      SizedBox(width: 8.scale),
                      const Text('Sair'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.scale),
            Padding(
              padding: EdgeInsets.only(right: 32.scale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem vindo ${userStore.loggedUser?.nome},',
                    style: theme.textTheme.headline5!.merge(
                      TextStyle(
                        fontWeight: FontWeight.w200,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.scale),
                  Text(
                    'Vamos adotar hoje?',
                    style: theme.textTheme.subtitle1!.merge(
                      TextStyle(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.scale,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Modular.to.pushNamed(CatsModule.routeName),
                  child: CircleAvatar(
                    backgroundColor: theme.backgroundColor,
                    radius: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'cat',
                          child: SvgPicture.asset(
                            AssetsPetHero.cat,
                          ),
                        ),
                        SizedBox(height: 4.scale),
                        Text(
                          'Xaninhos',
                          style: theme.textTheme.bodyText2!.merge(
                            TextStyle(
                              color: theme.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.scale),
                InkWell(
                  onTap: () => Modular.to.pushNamed(DogsModule.routeName),
                  child: CircleAvatar(
                    backgroundColor: theme.backgroundColor,
                    radius: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'dog',
                          child: SvgPicture.asset(
                            AssetsPetHero.dog,
                          ),
                        ),
                        SizedBox(height: 8.scale),
                        Text(
                          'Doguinhos',
                          style: theme.textTheme.bodyText2!.merge(
                            TextStyle(
                              color: theme.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.scale),
            Padding(
              padding: EdgeInsets.only(left: 40.scale, right: 32.scale),
              child: Text(
                'Os Melhores Amigos do homem',
                style: theme.textTheme.headline6!.merge(
                  const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.scale,
                    vertical: 16.scale,
                  ),
                  itemBuilder: (context, index) {
                    final Animal animal = controller.animals[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.scale,
                      ),
                      child: InkWell(
                          onTap: () => Modular.to.pushNamed(
                                DetailsModule.routeName,
                                arguments: {
                                  'animal': animal,
                                  'hasIcon': false,
                                },
                              ),
                          child: CardPet(animal: animal)),
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
