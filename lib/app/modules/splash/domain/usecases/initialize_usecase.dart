import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pethero/app/core/domain/usecases/i_usecase.dart';
import 'package:pethero/app/core/error/failures.dart';
import 'package:pethero/app/core/network/network_info.dart';
import 'package:pethero/app/core/stores/animal_store.dart';
import 'package:pethero/app/core/stores/user_store.dart';
import 'package:pethero/app/modules/home/home_module.dart';
import 'package:pethero/app/modules/login/login_module.dart';

class InitializeUsecase implements UseCase {
  final UserStore _userStore;
  final AnimalStore _animalStore;
  final NetworkInfo _networkInfo;
  InitializeUsecase({
    required NetworkInfo networkInfo,
    required AnimalStore animalStore,
    required UserStore userStore,
  })  : _userStore = userStore,
        _animalStore = animalStore,
        _networkInfo = networkInfo;
  @override
  Future<Either<IFailure, void>> call(params) async {
    try {
      _userStore.pipeline();
      await _networkInfo.init();
      await isConnected();
      if (_userStore.loggedUser == null) throw const UserFailure();
      await _animalStore.pipeline();
      Modular.to.pushReplacementNamed(HomeModule.routeName);
      return Right(voidRight);
    } on UserFailure {
      Modular.to.pushReplacementNamed(LoginModule.routeName);
      return Right(voidRight);
    } on InternetConectionFailure catch (e) {
      return Left(e);
    }
  }

  Future<void> isConnected() async {
    bool isConnect = await _networkInfo.isConnected;
    if (!isConnect) {
      throw const InternetConectionFailure(message: 'Sem Internet 📡');
    }
  }
}
