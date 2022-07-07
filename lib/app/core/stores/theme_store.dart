import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../extensions/theme_mode_extension.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  @observable
  ThemeMode _themeMode = ThemeMode.light;
  @observable
  Offset offset = const Offset(0, 0);

  @action
  Future<void> toggleThemeMode() async {
    _themeMode.isDark
        ? _themeMode = ThemeMode.light
        : _themeMode = ThemeMode.dark;

    //await _saveThemeMode(_themeMode);
  }

  @action
  void setOffset(Offset value) => offset = value;

  @computed
  ThemeMode get themeMode => _themeMode;

  //void init() => _themeMode = _readThemeMode();

  // ThemeMode _readThemeMode() {
  //   if (_containsThemePrefsSaved()) {
  //     final int index = _keyValueStorageDatabase.read<int>(
  //       key: ThemeDatabaseConst.kKeyTheme(
  //         _appInfoWay.packageInfo.appName,
  //       ),
  //     );

  //     return ThemeMode.values[index];
  //   } else {
  //     return ThemeMode.light;
  //   }
  // }

  // Future<bool> _saveThemeMode(ThemeMode value) async {
  //   try {
  //     return await _keyValueStorageDatabase.save<int>(
  //       key: ThemeDatabaseConst.kKeyTheme(
  //         _appInfoWay.packageInfo.appName,
  //       ),
  //       value: value.index,
  //     );
  //   } catch (e) {
  //     return false;
  //   }
  // }

}
