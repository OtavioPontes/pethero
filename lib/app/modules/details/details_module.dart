import 'package:flutter_modular/flutter_modular.dart';
import 'package:pethero/app/modules/details/presentation/page/details_page.dart';

class DetailsModule extends Module {
  static String get routeName => '/details/';
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => DetailsPage(
        animal: args.data['animal'],
        hasIcon: args.data['hasIcon'],
      ),
    )
  ];
}
