import 'package:travel_agency_front/app/models/car_rental_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class CarRentalViewData implements RowViewDataAbstract {
  final CarRentalModel carRental;

  String get originTitle => carRental.company ?? "";

  CarRentalViewData({this.carRental});
}
