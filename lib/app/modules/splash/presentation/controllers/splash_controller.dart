import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pethero/app/core/domain/usecases/i_usecase.dart';
import 'package:pethero/app/modules/splash/domain/usecases/initialize_usecase.dart';

import '../../../../core/mixins/state_store_mixin.dart';
import '../../../../core/utils/appinfo.dart';
import '../../../../core/utils/control_state.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase extends StateStore with Store {
  final InitializeUsecase _initializeUsecase;
  final AppInfo _appInfo;

  _SplashControllerBase({
    required InitializeUsecase initializeUsecase,
    required AppInfo appInfo,
  })  : _initializeUsecase = initializeUsecase,
        _appInfo = appInfo {
    _init();
  }

  @observable
  String failureMessage = '';
  @observable
  String loadingMessage = '';
  @observable
  String appVersion = '';
  @observable
  String appName = '';

  Future<void> _init() async {
    appName = _appInfo.packageInfo.appName;
    await Future.delayed(const Duration(seconds: 3));
    unawaited(pipeline());
  }

  @override
  Future<void> pipeline([BuildContext? context]) async {
    setControlState(ControlState.loading);
    await Future.delayed(const Duration(seconds: 1));
    appVersion = _appInfo.packageInfo.version;
    final result = await _initializeUsecase(const NoParams());
    result.fold((failure) {
      setControlState(ControlState.failure(failure.message));
    }, (success) {
      setControlState(ControlState.success);
      return success;
    });
  }
}
