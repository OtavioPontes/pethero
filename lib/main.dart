import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pethero/app/app_module.dart';
import 'package:pethero/app/app_widget.dart';
import 'package:pethero/app/core/utils/appinfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInfo.init();
  await Hive.initFlutter();
  await Hive.openBox('pet_hero');
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
