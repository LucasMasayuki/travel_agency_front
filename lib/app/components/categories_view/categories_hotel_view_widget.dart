import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_hotel_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';

class CategoriesHotelViewWidget extends StatefulWidget {
  const CategoriesHotelViewWidget({Key key}) : super(key: key);

  @override
  _CategoriesHotelViewWidgetState createState() =>
      _CategoriesHotelViewWidgetState();
}

class _CategoriesHotelViewWidgetState extends State<CategoriesHotelViewWidget> {
  final CategoriesViewModel categoriesViewModel = Modular.get();
  final CategoryHotelViewModel categoryHotelViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    categoryHotelViewModel.initialize();

    return Observer(builder: (_) {
      if (categoryHotelViewModel.isLoading) {
        return LoadingPageWidget();
      }

      if (categoryHotelViewModel.isEmptyPage) {
        return EmptyPageWidget();
      }

      return GridView.count(
        childAspectRatio: (300 / 500),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: categoryHotelViewModel.hotelViewData,
      );
    });
  }
}
