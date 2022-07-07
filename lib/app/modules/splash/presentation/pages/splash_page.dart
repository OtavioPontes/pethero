import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pethero/app/core/extensions/screen_extension.dart';
import 'package:pethero/app/core/style/assets.dart';
import 'package:pethero/app/core/utils/appinfo.dart';
import 'package:pethero/app/modules/splash/presentation/controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final SplashController controller = Modular.get<SplashController>();

    final ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: theme.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(top: 80.scale),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AssetsPetHero.logo,
                  ),
                  SizedBox(
                    height: 32.scale,
                  ),
                  Text(
                    'Pet \n\t\t\tHero',
                    style: theme.textTheme.headline3!.merge(
                      TextStyle(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.scale,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                CircularProgressIndicator(color: theme.colorScheme.onPrimary),
                SizedBox(height: 64.scale),
                Text(
                  'Rescue a Pet',
                  style: theme.textTheme.bodyText2,
                ),
                SizedBox(height: 8.scale),
                Text(
                  'v ${AppInfo.instance.packageInfo.version}',
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
