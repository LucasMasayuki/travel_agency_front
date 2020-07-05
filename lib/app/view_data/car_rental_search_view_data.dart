import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class CarRentalSearchViewData implements RowViewDataAbstract {
  final String location;
  final String returnDate;
  final String withdrawalDate;
  String get cartTitle => "";

  String get cartSubtitle => "";

  Icon get cartIcon => Icon(Icons.accessibility_new);

  CarRentalSearchViewData({
    this.location,
    this.returnDate,
    this.withdrawalDate,
  });
}
