import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/modules/checkout/checkout_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CheckoutPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
