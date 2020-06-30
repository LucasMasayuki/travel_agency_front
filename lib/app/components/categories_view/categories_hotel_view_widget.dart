import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_hotel_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';
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

      _loadClickableWidgetOnFrontLayer(categoryHotelViewModel);

      if (categoryHotelViewModel.isEmptyPage) {
        return EmptyPageWidget();
      }

      return GridView.count(
        childAspectRatio: (200 / 300),
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: categoryHotelViewModel.hotelViewData,
        padding: EdgeInsets.all(20),
      );
    });
  }

  void _loadClickableWidgetOnFrontLayer(
      CategoryHotelViewModel categoryHotelViewModel) {
    final FrontLayerViewModel frontLayerViewModel = Modular.get();

    Text clicakbleWidget = Text(
      "${categoryHotelViewModel.hotelViewData.length - 1} hoteis encontrados",
    );

    frontLayerViewModel.onLoadFrontView(clicakbleWidget);
  }
}
