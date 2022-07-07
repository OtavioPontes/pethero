import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pethero/app/core/stores/theme_store.dart';
import 'package:pethero/app/core/stores/user_store.dart';
import 'package:pethero/app/modules/home/home_module.dart';
import 'package:pethero/app/modules/login/login_module.dart';
import 'package:pethero/app/modules/splash/splash_module.dart';

import 'modules/details/details_module.dart';

class AppModule extends Module {
  static String get routeName => SplashModule.routeName;
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Hive.box('pet_hero'),
        ),
        Bind((i) => ThemeStore()),
        Bind(
          (i) => UserStore(
            box: i(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      SplashModule.routeName,
      module: SplashModule(),
    ),
    ModuleRoute(
      LoginModule.routeName,
      module: LoginModule(),
    ),
    ModuleRoute(
      HomeModule.routeName,
      module: HomeModule(),
    ),
    ModuleRoute(
      DetailsModule.routeName,
      module: DetailsModule(),
    ),
  ];
}
