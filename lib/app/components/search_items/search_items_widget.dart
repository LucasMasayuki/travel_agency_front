import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/categories_view/categories_view_model.dart';
import 'package:travel_agency_front/app/components/categories_view/category_flight_view_model.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/components/search_form/search_form_widget.dart';
import 'package:travel_agency_front/app/components/search_items/search_flight_view_model.dart';

class SearchItemsViewWidget extends StatefulWidget {
  const SearchItemsViewWidget({Key key}) : super(key: key);

  @override
  _SearchItemsViewWidgetState createState() => _SearchItemsViewWidgetState();
}

class _SearchItemsViewWidgetState extends State<SearchItemsViewWidget> {
  final CategoriesViewModel categoriesViewModel = Modular.get();
  final CategoryFlightViewModel categoryFlightViewModel = Modular.get();
  final SearchFlightViewModel searchFlightViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    List<Widget> inputs;
    Function onSearch = () => {};
    const EdgeInsets padding = EdgeInsets.all(20);

    return Observer(
      builder: (_) {
        switch (categoriesViewModel.currentChosenTabIndex) {
          case 0:
            inputs = [Text("3")];
            break;
          case 1:
            inputs = [
              Padding(
                padding: padding,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: TextFormFieldCustom(
                          hintText: 'adultos',
                          onChanged: searchFlightViewModel.onChangeAdults,
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormFieldCustom(
                          hintText: 'criancas',
                          onChanged: searchFlightViewModel.onChangeChildren,
                          prefixIcon: Icon(Icons.child_care),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: padding,
                child: Center(
                  child: TextFormFieldCustom(
                    hintText: 'data',
                    onChanged: searchFlightViewModel.onChangeDepartureDate,
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Center(
                  child: TextFormFieldCustom(
                    hintText: 'destino',
                    onChanged: searchFlightViewModel.onChangeDestiny,
                    prefixIcon: Icon(Icons.flight_land),
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Center(
                  child: TextFormFieldCustom(
                    hintText: 'origem',
                    onChanged: searchFlightViewModel.onChangeOrigin,
                    prefixIcon: Icon(Icons.flight_takeoff),
                  ),
                ),
              ),
            ];
            onSearch = () => categoryFlightViewModel
                .loadFlights(searchFlightViewModel.getFlight());
            break;
          case 2:
            inputs = [Text("2")];
            break;
          case 3:
            inputs = [Text("3")];
            break;
        }

        return SearchFormWidget(
          formBody: inputs,
          onSearch: onSearch,
        );
      },
    );
  }
}
