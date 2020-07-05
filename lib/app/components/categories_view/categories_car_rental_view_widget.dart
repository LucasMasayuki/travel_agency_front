import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_car_rental_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';

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
    if (!categoryCarRentalViewModel.initialized) {
      categoryCarRentalViewModel.initialize();
    }

    return Observer(builder: (_) {
      if (categoryCarRentalViewModel.isLoading) {
        return LoadingPageWidget();
      }
      if (categoryCarRentalViewModel.hasError) {
        _showErrorSnackBar(context);
        return EmptyPageWidget();
      }

      _loadClickableWidgetOnFrontLayer(categoryCarRentalViewModel);

      if (categoryCarRentalViewModel.isEmptyPage) {
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
      CategoryCarRentalViewModel categoryCarRentalViewModel) {
    final FrontLayerViewModel frontLayerViewModel = Modular.get();

    String text =
        "${categoryCarRentalViewModel.carRentalViewData.length} carros encontrados";

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
      children: categoryCarRentalViewModel.carRentalViewData,
    );
  }

  Widget _desktopGridView(double ratio) {
    return GridView.count(
      padding: EdgeInsets.all(20),
      childAspectRatio: ratio / 3,
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: categoryCarRentalViewModel.carRentalViewData,
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
