import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'core/screen/design_ui.dart';
import 'core/screen/screen_util.dart';
import 'core/stores/theme_store.dart';
import 'core/style/theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final ThemeStore themeStore = Modular.get<ThemeStore>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(AppModule.routeName);
    return ScreenUtil.builder(
      designUI: DesignUI.androidMaterial,
      designUITablet: DesignUI.androidMaterial,
      builder: (context, constraints, orientation) {
        return Observer(
          builder: (context) {
            return MaterialApp.router(
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
              debugShowCheckedModeBanner: false,
              title: 'Pet Hero',
              builder: (context, child) {
                return SafeArea(
                  child: Scaffold(
                    body: child,
                  ),
                );
              },
              theme: ThemesPetHero.light,
              themeMode: themeStore.themeMode,
              darkTheme: ThemesPetHero.dark,
            );
          },
        );
      },
    );
  }
}
