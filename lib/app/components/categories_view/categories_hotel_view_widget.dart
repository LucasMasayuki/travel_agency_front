import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_hotel_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';

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
    if (!categoryHotelViewModel.initialized) {
      categoryHotelViewModel.initialize();
    }

    return Observer(builder: (_) {
      if (categoryHotelViewModel.isLoading) {
        return LoadingPageWidget();
      }

      _loadClickableWidgetOnFrontLayer(categoryHotelViewModel);

      if (categoryHotelViewModel.hasError) {
        _showErrorSnackBar(context);
        return EmptyPageWidget();
      }

      if (categoryHotelViewModel.isEmptyPage) {
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
      CategoryHotelViewModel categoryHotelViewModel) {
    final FrontLayerViewModel frontLayerViewModel = Modular.get();

    String text =
        "${categoryHotelViewModel.hotelViewData.length} hoteis encontrados";

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
      children: categoryHotelViewModel.hotelViewData,
    );
  }

  Widget _desktopGridView(double ratio) {
    return GridView.count(
      padding: EdgeInsets.all(20),
      childAspectRatio: ratio / 3,
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: categoryHotelViewModel.hotelViewData,
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
