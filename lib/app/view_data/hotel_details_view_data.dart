import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/models/facilities_model.dart';
import 'package:travel_agency_front/app/models/hotel_details_model.dart';
import 'package:travel_agency_front/app/models/room_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class HotelDetailsViewData implements RowViewDataAbstract {
  final HotelDetailsModel hotelDetailsModel;

  String get cartTitle => hotelDetailsModel.name;

  String get cartSubtitle => hotelDetailsModel.address;

  Icon get cartIcon => Icon(Icons.hotel);

  String get name => hotelDetailsModel.name;
  String get address => hotelDetailsModel.address;
  String get stars => hotelDetailsModel.stars;
  String get completeCheckIn => hotelDetailsModel.completeCheckIn;
  String get completeCheckOut => hotelDetailsModel.completeCheckOut;
  List<RoomModel> get rooms => hotelDetailsModel.rooms;
  List<FacilitiesModel> get facilities => hotelDetailsModel.roomFacilities;

  HotelDetailsViewData({this.hotelDetailsModel});
}
