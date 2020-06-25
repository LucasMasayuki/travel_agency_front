import 'package:travel_agency_front/app/components/categories_view/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/category_flight_view_model.dart';
import 'package:travel_agency_front/app/components/search_items/search_flight_view_model.dart';
import 'package:travel_agency_front/app/repositories/hotel_repository.dart';
import 'package:travel_agency_front/app/repositories/flight_repository.dart';
import 'package:dio/dio.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/app_widget.dart';
import 'package:travel_agency_front/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HotelRepository()),
        Bind((i) => FlightRepository()),
        Bind((i) => ApiService(Dio())),
        Bind((i) => AppController()),
        Bind((i) => CategoriesViewModel()),
        Bind((i) => CategoryFlightViewModel()),
        Bind((i) => SearchFlightViewModel()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
