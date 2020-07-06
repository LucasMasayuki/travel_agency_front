import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/models/room_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class RoomViewData implements RowViewDataAbstract {
  final RoomModel roomModel;

  String get cartTitle => roomModel.name;

  String get cartSubtitle => roomModel.totalPeopleMessage;

  Icon get cartIcon => Icon(Icons.hotel);

  String get name => roomModel.name;
  String get totalPeopleMessage => roomModel.totalPeopleMessage;
  String get bedOptions => roomModel.bedOptions;
  String get originalPhoto => roomModel.originalPhoto;
  String get thumbnailPhoto => roomModel.thumbnailPhoto;
  String get roomtDescription => roomModel.roomtDescription;
  String get totalPrice => roomModel.totalPrice;
  String get pricePerNight => roomModel.pricePerNight;

  RoomViewData({this.roomModel});
}
