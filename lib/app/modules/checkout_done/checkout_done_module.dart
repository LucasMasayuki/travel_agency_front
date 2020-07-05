import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/modules/checkout_done/checkout_done_page.dart';

class CheckoutDoneModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => CheckoutDonePage(),
        ),
      ];

  static Inject get to => Inject<CheckoutDoneModule>.of();
}
