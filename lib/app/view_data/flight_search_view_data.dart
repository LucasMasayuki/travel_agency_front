import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class FlightSearchViewData implements RowViewDataAbstract {
  final int adults;
  final int children;
  final String departureDate;
  final String destiny;
  final String origin;

  FlightSearchViewData({
    this.adults,
    this.children,
    this.departureDate,
    this.destiny,
    this.origin,
  });
}
