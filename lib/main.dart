import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pethero/app/app_module.dart';
import 'package:pethero/app/app_widget.dart';
import 'package:pethero/app/core/style/assets.dart';
import 'package:pethero/app/core/utils/appinfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInfo.init();
  await Hive.initFlutter();
  await Hive.openBox('pet_hero');
  await Future.wait([
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AssetsPetHero.logo),
      null,
    ),
  ]);
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
