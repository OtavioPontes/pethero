import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pethero/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pethero/app/modules/home/presentation/pages/home_page.dart';
import 'package:pethero/app/modules/home/submodules/cats/cats_module.dart';
import 'package:pethero/app/modules/home/submodules/dogs/dogs_module.dart';

class HomeModule extends Module {
  static String get routeName => '/home/';
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(animalStore: i())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const HomePage(),
    ),
  ];
}
