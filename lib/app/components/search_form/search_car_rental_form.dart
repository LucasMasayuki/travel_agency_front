import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_agency_front/app/components/buttons/search_form_button.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_car_rental_view_model.dart';
import 'package:travel_agency_front/app/components/date_picker_field/date_picker_field.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_car_rental_view_model.dart';

class SearchCarRentalForm extends StatelessWidget {
  const SearchCarRentalForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchCarRentalViewModel searchCarRentalViewModel = Modular.get();

    List<Widget> formBody = _getSearchHotelsInputs(
      context,
      searchCarRentalViewModel,
    );

    formBody.add(_searchButton(searchCarRentalViewModel));

    return Form(
      child: ListView(
        children: formBody,
      ),
    );
  }

  Widget _searchButton(SearchCarRentalViewModel searchCarRentalViewModel) {
    final CategoryCarRentalViewModel categoryFlightViewModel = Modular.get();

    return Container(
      margin: const EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 20),
      child: SearchFormButton(
        categoryViewModel: categoryFlightViewModel,
        searchViewModel: searchCarRentalViewModel,
      ),
    );
  }

  List<Widget> _getSearchHotelsInputs(
    BuildContext context,
    SearchCarRentalViewModel searchCarRentalViewModel,
  ) {
    const EdgeInsets padding = EdgeInsets.all(20);

    return [
      Padding(
        padding: padding,
        child: Center(
          child: _locationTypeaheadWidget(context, searchCarRentalViewModel),
        ),
      ),
      Padding(
        padding: padding,
        child: _withdrawalAndReturnRowWidget(searchCarRentalViewModel),
      ),
    ];
  }

  Widget _withdrawalAndReturnRowWidget(
    SearchCarRentalViewModel searchCarRentalViewModel,
  ) {
    TextEditingController withdrawalController = TextEditingController();
    TextEditingController returnController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: DatePickerField(
              onChangeFormatter: "dd-MM-yyyy",
              hintText: 'Data retirada',
              onChanged: searchCarRentalViewModel.onChangeWithdrawalDate,
              controller: withdrawalController,
              validator: (_) {
                return !searchCarRentalViewModel.isValidWithdrawalDate()
                    ? 'Preencha a data de decolagem'
                    : null;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: DatePickerField(
              hintText: 'Data devolução',
              onChangeFormatter: "dd-MM-yyyy",
              onChanged: searchCarRentalViewModel.onChangeReturnDate,
              controller: returnController,
              validator: (_) {
                return !searchCarRentalViewModel.isValidReturnDate()
                    ? 'Preencha a data de decolagem'
                    : null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _locationTypeaheadWidget(
    BuildContext context,
    SearchCarRentalViewModel searchCarRentalViewModel,
  ) {
    TypeAheadField typeaheadField = TypeAheadField(
      noItemsFoundBuilder: (BuildContext context) => Container(),
      loadingBuilder: (BuildContext context) => Container(),
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
          hintText: "Localização",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.flight_land),
        ),
      ),
      suggestionsCallback: searchCarRentalViewModel.onTypeAhead,
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Icon(Icons.location_city),
          title: Text(suggestion),
        );
      },
      onSuggestionSelected: searchCarRentalViewModel.onChangeLocation,
    );

    return typeaheadField;
  }
}
