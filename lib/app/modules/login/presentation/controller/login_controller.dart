import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import 'package:pethero/app/core/domain/entities/user_entity.dart';
import 'package:pethero/app/core/domain/usecases/i_usecase.dart';
import 'package:pethero/app/core/domain/usecases/login_usecase.dart';
import 'package:pethero/app/core/error/failures.dart';
import 'package:pethero/app/core/extensions/screen_extension.dart';
import 'package:pethero/app/core/mixins/state_store_mixin.dart';
import 'package:pethero/app/core/stores/animal_store.dart';
import 'package:pethero/app/core/stores/user_store.dart';
import 'package:pethero/app/core/style/colors.dart';
import 'package:pethero/app/core/utils/control_state.dart';
import 'package:pethero/app/modules/home/home_module.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase extends StateStore with Store {
  final LoginUsecase _loginUsecase;
  final UserStore _userStore;
  final AnimalStore _animalStore;
  final TextEditingController emailController = TextEditingController();
  _LoginControllerBase({
    required AnimalStore animalStore,
    required LoginUsecase loginUsecase,
    required UserStore userStore,
  })  : _loginUsecase = loginUsecase,
        _animalStore = animalStore,
        _userStore = userStore;

  @override
  Future<void> pipeline([BuildContext? context]) async {
    setControlState(ControlState.start);
    await login(context!);

    setControlState(ControlState.success);
  }

  Future<void> login(BuildContext context) async {
    try {
      setControlState(ControlState.loading);
      final User user = await handleUseCase(
        _loginUsecase,
        ParamsLoginUsecase(email: emailController.text),
      );
      await _userStore.setUser(user);
      await _animalStore.pipeline();
      Modular.to.navigate(HomeModule.routeName);
      setControlState(ControlState.success);
    } on IFailure catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorsPetHero().red,
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: ColorsPetHero().white,
              ),
              SizedBox(width: 16.scale),
              Text(
                e.message,
              )
            ],
          ),
        ),
      );
      setControlState(
        ControlState.failure(e.message),
      );
    }
  }
}
