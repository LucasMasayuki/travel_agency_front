import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_car_rental_view_model.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/components/search_form/search_form_widget.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_car_rental_view_model.dart';

class SearchCarRentalForm extends StatelessWidget {
  const SearchCarRentalForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryCarRentalViewModel categoryCarRentalViewModel = Modular.get();
    final SearchCarRentalViewModel searchCarRentalViewModel = Modular.get();

    return SearchFormWidget(
      formBody: _getSearchHotelsInputs(context, searchCarRentalViewModel),
      onSearch: () => categoryCarRentalViewModel
          .loadCarRentals(searchCarRentalViewModel.getCarRental()),
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
          child: TypeAheadField(
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
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormFieldCustom(
                  hintText: 'Data retirada ',
                  onChanged: searchCarRentalViewModel.onChangeWithdrawalDate,
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextFormFieldCustom(
                  hintText: 'Data devolução',
                  onChanged: searchCarRentalViewModel.onChangeReturnDate,
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
