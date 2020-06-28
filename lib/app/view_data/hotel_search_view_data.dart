import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class HotelSearchViewData implements RowViewDataAbstract {
  final int adults;
  final String checkIn;
  final String checkOut;
  final String destiny;

  HotelSearchViewData({
    this.adults,
    this.checkIn,
    this.checkOut,
    this.destiny,
  });
}
