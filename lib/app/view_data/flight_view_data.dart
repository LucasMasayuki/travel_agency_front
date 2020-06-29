import 'package:travel_agency_front/app/models/flight_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class FlightViewData implements RowViewDataAbstract {
  final FlightModel flight;

  String get originTitle => flight.backDestiny ?? "";

  FlightViewData({this.flight});
}
