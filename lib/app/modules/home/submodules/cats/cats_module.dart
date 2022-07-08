import 'package:flutter_modular/flutter_modular.dart';
import 'package:pethero/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pethero/app/modules/home/submodules/cats/presentation/pages/cats_page.dart';

class CatsModule extends Module {
  static String get routeName => '/cats/';
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(animalStore: i())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const CatsPage(),
    ),
  ];
}
