import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/forms/search_car_rental_form.dart';
import 'package:travel_agency_front/app/components/forms/search_flight_form.dart';
import 'package:travel_agency_front/app/components/forms/search_hotel_form.dart';

class SearchItemsViewWidget extends StatefulWidget {
  const SearchItemsViewWidget({Key key}) : super(key: key);

  @override
  _SearchItemsViewWidgetState createState() => _SearchItemsViewWidgetState();
}

class _SearchItemsViewWidgetState extends State<SearchItemsViewWidget> {
  final CategoriesViewModel categoriesViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    Widget form;

    return Observer(
      builder: (_) {
        switch (categoriesViewModel.currentTab) {
          case "hotel":
            form = SearchHotelForm();
            break;
          case "flight":
            form = SearchFlightForm();
            break;
          case "car":
            form = SearchCarRentalForm();
            break;
        }

        return form;
      },
    );
  }
}
