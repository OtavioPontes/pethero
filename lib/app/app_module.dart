import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pethero/app/core/data/datasources/i_remote_datasource.dart';
import 'package:pethero/app/core/data/datasources/remote_datasource.dart';
import 'package:pethero/app/core/data/repositories/animal_repository.dart';
import 'package:pethero/app/core/data/repositories/user_repository.dart';
import 'package:pethero/app/core/domain/repositories/i_animal_repository.dart';
import 'package:pethero/app/core/domain/repositories/i_user_repository.dart';
import 'package:pethero/app/core/domain/usecases/get_cats_usecase.dart';
import 'package:pethero/app/core/network/network_info.dart';
import 'package:pethero/app/core/stores/animal_store.dart';
import 'package:pethero/app/core/stores/theme_store.dart';
import 'package:pethero/app/core/stores/user_store.dart';
import 'package:pethero/app/modules/home/home_module.dart';
import 'package:pethero/app/modules/login/login_module.dart';
import 'package:pethero/app/modules/splash/splash_module.dart';

import 'core/domain/usecases/get_dogs_usecase.dart';
import 'modules/details/details_module.dart';
import 'modules/home/submodules/cats/cats_module.dart';
import 'modules/home/submodules/dogs/dogs_module.dart';

class AppModule extends Module {
  static String get routeName => SplashModule.routeName;
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Hive.box('pet_hero'),
        ),
        Bind((i) => Dio()),
        Bind((i) => ThemeStore()),
        Bind((i) => NetworkInfo()),
        Bind((i) => UserStore(box: i())),
        Bind((i) => AnimalStore(getCatsUsecase: i(), getDogsUsecase: i())),
        Bind<IUserRepository>(
          (i) => UserRepository(
            remoteDatasource: i(),
          ),
        ),
        Bind<IAnimalRepository>(
          (i) => AnimalRepository(
            remoteDatasource: i(),
          ),
        ),
        Bind<IRemoteDatasource>(
          (i) => RemoteDatasource(
            dio: i(),
          ),
        ),
        Bind((i) => GetCatsUsecase(animalRepository: i())),
        Bind((i) => GetDogsUsecase(animalRepository: i())),
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
      DogsModule.routeName,
      module: DogsModule(),
    ),
    ModuleRoute(
      CatsModule.routeName,
      module: CatsModule(),
    ),
    ModuleRoute(
      DetailsModule.routeName,
      module: DetailsModule(),
    ),
  ];
}
