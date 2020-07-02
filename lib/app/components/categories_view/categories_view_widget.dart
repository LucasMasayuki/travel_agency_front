import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/categories_car_rental_view_widget.dart';
import 'package:travel_agency_front/app/components/categories_view/categories_flight_view_widget.dart';
import 'package:travel_agency_front/app/components/categories_view/categories_hotel_view_widget.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';

class CategoriesViewWidget extends StatefulWidget {
  const CategoriesViewWidget({Key key}) : super(key: key);

  @override
  _CategoriesViewWidgetState createState() => _CategoriesViewWidgetState();
}

class _CategoriesViewWidgetState extends State<CategoriesViewWidget> {
  final CategoriesViewModel categoriesViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (categoriesViewModel.currentTab) {
        case "hotel":
          return CategoriesHotelViewWidget();

        case "flight":
          return CategoriesFlightViewWidget();

        case "car":
          return CategoriesCarRentalViewWidget();
      }

      return EmptyPageWidget();
    });
  }
}
