import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pethero/app/core/extensions/screen_extension.dart';
import 'package:pethero/app/core/style/assets.dart';
import 'package:pethero/app/modules/login/presentation/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get<LoginController>();
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        color: theme.backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(top: 80.scale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsPetHero.logo),
              SizedBox(
                height: 40.scale,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: theme.textTheme.headline4!.merge(
                      TextStyle(
                        fontWeight: FontWeight.w300,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.scale,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.canvasColor,
                    ),
                    width: size.width * 0.7,
                    child: TextField(
                      controller: controller.emailController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8.scale),
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Email',
                        hintStyle: theme.textTheme.bodyText2,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.scale),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.canvasColor,
                    ),
                    width: size.width * 0.7,
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8.scale),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Senha',
                        hintStyle: theme.textTheme.bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.scale),
              Observer(builder: (_) {
                return TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: controller.state.isNotLoading
                        ? Size(120.scale, 40.scale)
                        : Size(120.scale, 60.scale),
                    backgroundColor: controller.state.isNotLoading
                        ? theme.primaryColor
                        : theme.disabledColor,
                  ),
                  onPressed: controller.state.isNotLoading
                      ? () => controller.pipeline(context)
                      : null,
                  child: controller.state.isNotLoading
                      ? Text(
                          'Entrar',
                          style: theme.textTheme.bodyText1!.merge(
                            TextStyle(
                              color: theme.canvasColor,
                            ),
                          ),
                        )
                      : CircularProgressIndicator(
                          color: theme.primaryColor,
                        ),
                );
              }),
              SizedBox(height: 40.scale),
              Text(
                'Rescue a Pet',
                style: theme.textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
