import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_payment_form_view_model.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_person_info_form_view_model.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_steps_view_model.dart';
import 'package:travel_agency_front/app/modules/checkout/checkout_page.dart';
import 'package:travel_agency_front/app/repositories/checkout_repository.dart';

class CheckoutModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CheckoutPaymentFormViewModel()),
        Bind((i) => CheckoutPersonInfoFormViewModel()),
        Bind((i) => CheckoutStepsViewModel()),
        Bind((i) => CheckoutRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => CheckoutPage(
            item: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<CheckoutModule>.of();
}
