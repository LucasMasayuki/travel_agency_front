import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_agency_front/app/components/buttons/search_form_button.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_flight_view_model.dart';
import 'package:travel_agency_front/app/components/date_picker_field/date_picker_field.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_flight_view_model.dart';

class SearchFlightForm extends StatelessWidget {
  const SearchFlightForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchFlightViewModel searchFlightViewModel = Modular.get();

    List<Widget> formBody = _getSearchFlightsInputs(
      context,
      searchFlightViewModel,
    );

    formBody.add(_searchButton(searchFlightViewModel));

    return Form(
      child: ListView(
        children: formBody,
      ),
    );
  }

  List<Widget> _getSearchFlightsInputs(
    BuildContext context,
    SearchFlightViewModel searchFlightViewModel,
  ) {
    const EdgeInsets padding = EdgeInsets.all(20);
    TextEditingController dateController = TextEditingController();

    return [
      Padding(
        padding: padding,
        child: _adulltAndChildrensRowWidget(searchFlightViewModel),
      ),
      Padding(
        padding: padding,
        child: Center(
          child: DatePickerField(
            hintText: 'Data de decoragem',
            onChanged: searchFlightViewModel.onChangeDepartureDate,
            controller: dateController,
            validator: (_) {
              return !searchFlightViewModel.isValidDepartureDate()
                  ? 'Preencha a data de decolagem'
                  : null;
            },
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: Center(
          child: _originTypeaheadWidget(context, searchFlightViewModel),
        ),
      ),
      Padding(
        padding: padding,
        child: Center(
          child: _destinyTypeaheadWidget(context, searchFlightViewModel),
        ),
      ),
    ];
  }

  Widget _searchButton(SearchFlightViewModel searchFlightViewModel) {
    final CategoryFlightViewModel categoryFlightViewModel = Modular.get();

    return Container(
      margin: const EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 20),
      child: SearchFormButton(
        categoryViewModel: categoryFlightViewModel,
        searchViewModel: searchFlightViewModel,
      ),
    );
  }

  Widget _adulltAndChildrensRowWidget(
      SearchFlightViewModel searchFlightViewModel) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              hintText: 'Adultos',
              onChanged: searchFlightViewModel.onChangeAdults,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !searchFlightViewModel.isValidAdults()
                    ? 'Preencha o número de adultos'
                    : null;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              hintText: 'Criancas',
              onChanged: searchFlightViewModel.onChangeChildren,
              prefixIcon: Icon(Icons.child_care),
              validator: (_) {
                return !searchFlightViewModel.isValidChildren()
                    ? 'Preencha o número de criancas'
                    : null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _originTypeaheadWidget(
      BuildContext context, SearchFlightViewModel searchFlightViewModel) {
    TypeAheadField typeaheadField = TypeAheadField(
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
    );

    return typeaheadField;
  }

  Widget _destinyTypeaheadWidget(
      BuildContext context, SearchFlightViewModel searchFlightViewModel) {
    TypeAheadField typeaheadField = TypeAheadField(
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
    );

    return typeaheadField;
  }
}
