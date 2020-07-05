import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/models/car_model.dart';
import 'package:travel_agency_front/app/models/car_rental_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class CarRentalViewData implements RowViewDataAbstract {
  final CarRentalModel carRental;
  String get cartTitle =>
      carRental.car.model.substring(0, carRental.car.model.indexOf('ou'));

  String get cartSubtitle => "R\$ ${carRental.total}";

  Icon get cartIcon => Icon(Icons.directions_car);

  String get company => carRental.company;
  CarModel get car => carRental.car;
  String get title =>
      carRental.car.model.substring(0, carRental.car.model.indexOf('ou'));
  String get placeWithdrawn => carRental.placeWithdrawn;
  double get total => carRental.total;
  String get airConditioning => carRental.car.airConditioning ? "Sim" : "Não";

  CarRentalViewData({this.carRental});
}
