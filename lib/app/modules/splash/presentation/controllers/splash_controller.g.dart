// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  final _$failureMessageAtom =
      Atom(name: '_SplashControllerBase.failureMessage');

  @override
  String get failureMessage {
    _$failureMessageAtom.reportRead();
    return super.failureMessage;
  }

  @override
  set failureMessage(String value) {
    _$failureMessageAtom.reportWrite(value, super.failureMessage, () {
      super.failureMessage = value;
    });
  }

  final _$loadingMessageAtom =
      Atom(name: '_SplashControllerBase.loadingMessage');

  @override
  String get loadingMessage {
    _$loadingMessageAtom.reportRead();
    return super.loadingMessage;
  }

  @override
  set loadingMessage(String value) {
    _$loadingMessageAtom.reportWrite(value, super.loadingMessage, () {
      super.loadingMessage = value;
    });
  }

  final _$appVersionAtom = Atom(name: '_SplashControllerBase.appVersion');

  @override
  String get appVersion {
    _$appVersionAtom.reportRead();
    return super.appVersion;
  }

  @override
  set appVersion(String value) {
    _$appVersionAtom.reportWrite(value, super.appVersion, () {
      super.appVersion = value;
    });
  }

  final _$appNameAtom = Atom(name: '_SplashControllerBase.appName');

  @override
  String get appName {
    _$appNameAtom.reportRead();
    return super.appName;
  }

  @override
  set appName(String value) {
    _$appNameAtom.reportWrite(value, super.appName, () {
      super.appName = value;
    });
  }

  @override
  String toString() {
    return '''
failureMessage: ${failureMessage},
loadingMessage: ${loadingMessage},
appVersion: ${appVersion},
appName: ${appName}
    ''';
  }
}
