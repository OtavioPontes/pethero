import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pethero/app/core/domain/usecases/login_usecase.dart';
import 'package:pethero/app/modules/login/presentation/controller/login_controller.dart';
import 'package:pethero/app/modules/login/presentation/pages/login_page.dart';

class LoginModule extends Module {
  static String get routeName => '/login/';
  @override
  List<Bind> get binds => [
        Bind(
          (i) => LoginUsecase(
            userRepository: i(),
          ),
        ),
        Bind(
          (i) => LoginController(
            animalStore: i(),
            loginUsecase: i(),
            userStore: i(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const LoginPage(),
    )
  ];
}
