import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_flight_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';

class CategoriesFlightViewWidget extends StatefulWidget {
  const CategoriesFlightViewWidget({Key key}) : super(key: key);

  @override
  _CategoriesFlightViewWidgetState createState() =>
      _CategoriesFlightViewWidgetState();
}

class _CategoriesFlightViewWidgetState
    extends State<CategoriesFlightViewWidget> {
  final CategoriesViewModel categoriesViewModel = Modular.get();
  final CategoryFlightViewModel categoryFlightViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    categoryFlightViewModel.initialize();

    return Observer(builder: (_) {
      if (categoryFlightViewModel.isLoading) {
        return LoadingPageWidget();
      }

      _loadClickableWidgetOnFrontLayer(categoryFlightViewModel);

      if (categoryFlightViewModel.isEmptyPage) {
        return EmptyPageWidget();
      }

      return GridView.count(
        childAspectRatio: (300 / 500),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: categoryFlightViewModel.flightViewData,
      );
    });
  }

  void _loadClickableWidgetOnFrontLayer(
      CategoryFlightViewModel categoryFlightViewModel) {
    final FrontLayerViewModel frontLayerViewModel = Modular.get();

    Text clicakbleWidget = Text(
      "${categoryFlightViewModel.flightViewData.length - 1} voos encontrados",
    );

    frontLayerViewModel.onLoadFrontView(clicakbleWidget);
  }
}
