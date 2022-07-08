import 'package:flutter_modular/flutter_modular.dart';
import 'package:pethero/app/core/utils/appinfo.dart';
import 'package:pethero/app/modules/splash/domain/usecases/initialize_usecase.dart';
import 'package:pethero/app/modules/splash/presentation/controllers/splash_controller.dart';
import 'package:pethero/app/modules/splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  static String get routeName => '/splash/';
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SplashController(
            appInfo: AppInfo.instance,
            initializeUsecase: i(),
          ),
        ),
        Bind(
          (i) => InitializeUsecase(
            animalStore: i(),
            networkInfo: i(),
            userStore: i(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const SplashPage(),
    )
  ];
}
