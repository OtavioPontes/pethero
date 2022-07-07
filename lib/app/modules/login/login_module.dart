import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pethero/app/core/stores/theme_store.dart';

class LoginModule extends Module {
  static String get routeName => '/login/';
  @override
  List<Bind> get binds => [
        Bind((i) => ThemeStore()),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => Container(),
    )
  ];
}
