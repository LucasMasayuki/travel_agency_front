import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_flight_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';

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
    if (!categoryFlightViewModel.initialized) {
      categoryFlightViewModel.initialize();
    }

    return Observer(builder: (_) {
      if (categoryFlightViewModel.isLoading) {
        return LoadingPageWidget();
      }

      _loadClickableWidgetOnFrontLayer(categoryFlightViewModel);

      if (categoryFlightViewModel.hasError) {
        _showErrorSnackBar(context);
        return EmptyPageWidget();
      }

      if (categoryFlightViewModel.isEmptyPage) {
        return EmptyPageWidget();
      }

      double ratio = MediaHelper.getChildAspectRatio(context);

      if (MediaHelper.isMobile(context)) {
        return _mobileGridView(ratio);
      }

      return _desktopGridView(ratio);
    });
  }

  void _loadClickableWidgetOnFrontLayer(
      CategoryFlightViewModel categoryFlightViewModel) {
    final FrontLayerViewModel frontLayerViewModel = Modular.get();

    String text =
        "${categoryFlightViewModel.flightViewData.length - 1} voos encontrados";

    frontLayerViewModel.onLoadFrontView(text);
  }

  Widget _mobileGridView(double ratio) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      childAspectRatio: ratio,
      shrinkWrap: true,
      crossAxisCount: 1,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: categoryFlightViewModel.flightViewData,
    );
  }

  Widget _desktopGridView(double ratio) {
    return GridView.count(
      padding: EdgeInsets.all(20),
      childAspectRatio: ratio / 2,
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: categoryFlightViewModel.flightViewData,
    );
  }

  void _showErrorSnackBar(BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Algo deu errado.'), Icon(Icons.error)],
          ),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
  }
}
