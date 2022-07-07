import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pethero/app/core/domain/usecases/i_usecase.dart';
import 'package:pethero/app/core/error/failures.dart';
import 'package:pethero/app/core/stores/user_store.dart';
import 'package:pethero/app/modules/login/login_module.dart';

class InitializeUsecase implements UseCase {
  final UserStore _userStore;
  InitializeUsecase({
    required UserStore userStore,
  }) : _userStore = userStore;
  @override
  Future<Either<IFailure, void>> call(params) async {
    try {
      _userStore.pipeline();
      if (_userStore.loggedUser == null) throw const UserFailure();
      return Right(voidRight);
    } on UserFailure {
      Modular.to.pushReplacementNamed(LoginModule.routeName);
      return Right(voidRight);
    }
  }
}
