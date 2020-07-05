import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:travel_agency_front/app/models/car_model.dart';
import 'package:travel_agency_front/app/models/car_rental_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

final formatter = NumberFormat.currency(locale: 'pt_br', name: 'BRA');

class CarRentalViewData implements RowViewDataAbstract {
  final CarRentalModel carRental;
  String get cartTitle =>
      carRental.car.model.substring(0, carRental.car.model.indexOf('ou'));

  String get cartSubtitle => "R\$ ${carRental.total}";

  Icon get cartIcon => Icon(Icons.accessibility_new);

  String get company => carRental.company;
  CarModel get car => carRental.car;
  String get title =>
      carRental.car.model.substring(0, carRental.car.model.indexOf('ou'));
  String get placeWithdrawn => carRental.placeWithdrawn;
  String get total => formatter.format(carRental.total);
  String get airConditioning => carRental.car.airConditioning ? "Sim" : "Não";

  CarRentalViewData({this.carRental});
}
