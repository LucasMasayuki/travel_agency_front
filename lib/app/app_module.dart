import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_car_rental_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_flight_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_hotel_view_model.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_flight_view_model.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_hotel_view_model.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_item_view_model.dart';
import 'package:travel_agency_front/app/modules/hotel_details/hotel_details_module.dart';
import 'package:travel_agency_front/app/repositories/car_rental_repository.dart';
import 'package:travel_agency_front/app/repositories/flight_city_repository.dart';
import 'package:travel_agency_front/app/repositories/hotel_city_repository.dart';
import 'package:travel_agency_front/app/repositories/hotel_repository.dart';
import 'package:travel_agency_front/app/repositories/flight_repository.dart';
import 'package:dio/dio.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/app_widget.dart';
import 'package:travel_agency_front/app/modules/home/home_module.dart';
import 'package:travel_agency_front/app/services/api_soap_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CarRentalRepository()),
        Bind((i) => HotelRepository()),
        Bind((i) => HotelCityRepository()),
        Bind((i) => FlightCityRepository()),
        Bind((i) => FlightRepository()),
        Bind((i) => ApiService(Dio())),
        Bind((i) => ApiSoapService()),
        Bind((i) => CategoriesViewModel()),
        Bind((i) => CategoryFlightViewModel()),
        Bind((i) => CategoryCarRentalViewModel()),
        Bind((i) => SearchItemViewModel()),
        Bind((i) => SearchFlightViewModel()),
        Bind((i) => CategoryHotelViewModel()),
        Bind((i) => SearchHotelViewModel()),
        Bind((i) => FrontLayerViewModel()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/hotelDetails', module: HotelDetailsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
