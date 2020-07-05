import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class FlightSearchViewData implements RowViewDataAbstract {
  final int adults;
  final int children;
  final String departureDate;
  final String returnDate;
  final String destiny;
  final String origin;

  String get cartTitle => "";

  String get cartSubtitle => "";

  Icon get cartIcon => Icon(Icons.accessibility_new);

  FlightSearchViewData({
    this.adults,
    this.children,
    this.departureDate,
    this.returnDate,
    this.destiny,
    this.origin,
  });
}
