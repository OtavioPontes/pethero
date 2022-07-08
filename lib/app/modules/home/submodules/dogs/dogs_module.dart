import 'package:flutter_modular/flutter_modular.dart';
import 'package:pethero/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pethero/app/modules/home/submodules/dogs/presentation/pages/dogs_page.dart';

class DogsModule extends Module {
  static String get routeName => '/dogs/';
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(animalStore: i())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const DogsPage(),
    ),
  ];
}
