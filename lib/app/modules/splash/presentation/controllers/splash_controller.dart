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
    unawaited(pipeline());
  }

  @override
  Future<void> pipeline([BuildContext? context]) async {
    setControlState(ControlState.loading);
    appVersion = _appInfo.packageInfo.version;
    await handleUseCase(_initializeUsecase);
    setControlState(ControlState.success);
  }
}
