import 'package:travel_agency_front/app/models/flight_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class FlightViewData implements RowViewDataAbstract {
  final FlightModel flight;

  String get goingOrigin =>
      flight.goingOrigin.substring(0, flight.goingOrigin.indexOf('('));

  String get goingDestiny =>
      flight.goingDestiny.substring(0, flight.goingDestiny.indexOf('('));

  String get backOrigin =>
      flight.backOrigin.substring(0, flight.backOrigin.indexOf('('));

  String get backDestiny =>
      flight.backDestiny.substring(0, flight.backDestiny.indexOf('('));

  String get goingCompany => flight.goingCompany;
  String get backCompany => flight.backCompany;
  List get backScales => flight.backScales;
  List get goingScales => flight.goingScales;
  String get goingDuration => flight.goingDuration;
  String get backDuration => flight.backDuration;
  String get backTakeOffTime => flight.backTakeOffTime;
  String get backLandingTime => flight.backLandingTime;
  String get goingTakeOffTime => flight.goingTakeOffTime;
  String get goingLandingTime => flight.goingLandingTime;
  String get total => flight.total;
  String get valuePerAdult => flight.valuePerAdult;
  String get valuePerChild => flight.valuePerChild;
  String get valuePerLapChild => flight.valuePerLapChild;
  int get quantityOfCheckedBaggage => flight.quantityOfCheckedBaggage;

  FlightViewData({this.flight});
}
