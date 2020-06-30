import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_car_rental_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';

class CategoriesCarRentalViewWidget extends StatefulWidget {
  const CategoriesCarRentalViewWidget({Key key}) : super(key: key);

  @override
  _CategoriesCarRentalViewWidgetState createState() =>
      _CategoriesCarRentalViewWidgetState();
}

class _CategoriesCarRentalViewWidgetState
    extends State<CategoriesCarRentalViewWidget> {
  final CategoriesViewModel categoriesViewModel = Modular.get();
  final CategoryCarRentalViewModel categoryCarRentalViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    categoryCarRentalViewModel.initialize();

    return Observer(builder: (_) {
      if (categoryCarRentalViewModel.isLoading) {
        return LoadingPageWidget();
      }

      _loadClickableWidgetOnFrontLayer(categoryCarRentalViewModel);

      if (categoryCarRentalViewModel.isEmptyPage) {
        return EmptyPageWidget();
      }

      return GridView.count(
        childAspectRatio: (300 / 500),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: categoryCarRentalViewModel.carRentalViewData,
      );
    });
  }

  void _loadClickableWidgetOnFrontLayer(
      CategoryCarRentalViewModel categoryCarRentalViewModel) {
    final FrontLayerViewModel frontLayerViewModel = Modular.get();

    Text clicakbleWidget = Text(
      "${categoryCarRentalViewModel.carRentalViewData.length - 1} carros encontrados",
    );

    frontLayerViewModel.onLoadFrontView(clicakbleWidget);
  }
}
