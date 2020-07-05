import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/models/hotel_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class HotelViewData implements RowViewDataAbstract {
  final HotelModel hotel;

  String get cartTitle => hotel.name;

  String get cartSubtitle => hotel.name;

  Icon get cartIcon => Icon(Icons.hotel);

  int get id => hotel.id;
  String get hotelName => hotel.name;
  String get neighborhoodCity => hotel.neighborhoodCity;
  int get stars => hotel.stars;
  String get photo => hotel.photo;
  String get pricePerNight => hotel.pricePerNight;
  String get total => hotel.total;

  HotelViewData({this.hotel});
}
