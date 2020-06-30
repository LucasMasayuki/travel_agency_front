import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_hotel_view_model.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/components/search_form/search_form_widget.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_hotel_view_model.dart';

class SearchHotelForm extends StatelessWidget {
  const SearchHotelForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryHotelViewModel categoryHotelViewModel = Modular.get();
    final SearchHotelViewModel searchHotelViewModel = Modular.get();

    return SearchFormWidget(
      formBody: _getSearchHotelsInputs(context, searchHotelViewModel),
      onSearch: () =>
          categoryHotelViewModel.loadHotels(searchHotelViewModel.getHotels()),
    );
  }

  List<Widget> _getSearchHotelsInputs(
    BuildContext context,
    SearchHotelViewModel searchHotelViewModel,
  ) {
    const EdgeInsets padding = EdgeInsets.all(20);
    TextEditingController destinyController = TextEditingController();

    return [
      Padding(
        padding: padding,
        child: Center(
          child: TypeAheadField(
            noItemsFoundBuilder: (BuildContext context) => Container(),
            loadingBuilder: (BuildContext context) => Container(),
            textFieldConfiguration: TextFieldConfiguration(
              controller: destinyController,
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
            suggestionsCallback: searchHotelViewModel.onTypeAhead,
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              searchHotelViewModel.onChangeDestiny(suggestion);
              destinyController.text = suggestion;
            },
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
                  hintText: 'check in',
                  onChanged: searchHotelViewModel.onChangeCheckIn,
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextFormFieldCustom(
                  hintText: 'check out',
                  onChanged: searchHotelViewModel.onChangeCheckOut,
                  prefixIcon: Icon(Icons.calendar_today),
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
            hintText: 'Número de adultos',
            onChanged: searchHotelViewModel.onChangeAdults,
            prefixIcon: Icon(Icons.person),
          ),
        ),
      ),
    ];
  }
}
