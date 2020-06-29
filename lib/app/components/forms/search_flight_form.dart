import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_flight_view_model.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/components/search_form/search_form_widget.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_flight_view_model.dart';

class SearchFlightForm extends StatelessWidget {
  const SearchFlightForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchFlightViewModel searchFlightViewModel = Modular.get();
    final CategoryFlightViewModel categoryFlightViewModel = Modular.get();

    return SearchFormWidget(
      formBody: _getSearchFlightsInputs(context, searchFlightViewModel),
      onSearch: () => categoryFlightViewModel
          .loadFlights(searchFlightViewModel.getFlight()),
    );
  }

  List<Widget> _getSearchFlightsInputs(
    BuildContext context,
    SearchFlightViewModel searchFlightViewModel,
  ) {
    const EdgeInsets padding = EdgeInsets.all(20);

    return [
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
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(32.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Destino",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.flight_land),
              ),
            ),
            suggestionsCallback: searchFlightViewModel.onTypeAhead,
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: searchFlightViewModel.onChangeDestiny,
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: Center(
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(32.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Origem",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.flight_land),
              ),
            ),
            suggestionsCallback: searchFlightViewModel.onTypeAhead,
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.flight_takeoff),
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: searchFlightViewModel.onChangeDestiny,
          ),
        ),
      ),
    ];
  }
}
