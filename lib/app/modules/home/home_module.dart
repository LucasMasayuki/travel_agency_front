import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/modules/checkout/checkout_module.dart';
import 'package:travel_agency_front/app/modules/home/home_page.dart';
import 'package:travel_agency_front/app/modules/hotel_details/hotel_details_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router(
          '/hotelDetails',
          child: (_, args) => HotelDetailsPage(
            hotelId: args.data["hoteld"],
            checkIn: args.data["checkIn"],
            checkOut: args.data["checkOut"],
            name: args.data["name"],
            adults: args.data["adults"],
          ),
        ),
        Router(
          '/checkout',
          module: CheckoutModule(),
        )
      ];

  static Inject get to => Inject<HomeModule>.of();
}
