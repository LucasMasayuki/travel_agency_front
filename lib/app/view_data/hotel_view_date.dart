import 'package:travel_agency_front/app/models/hotel_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class HotelViewData implements RowViewDataAbstract {
  final HotelModel hotel;

  String get title => hotel.name;

  HotelViewData({this.hotel});
}
