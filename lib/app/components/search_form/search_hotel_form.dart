import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_agency_front/app/components/buttons/search_form_button.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/category_hotel_view_model.dart';
import 'package:travel_agency_front/app/components/date_picker_field/date_picker_field.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_hotel_view_model.dart';

class SearchHotelForm extends StatelessWidget {
  const SearchHotelForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchHotelViewModel searchHotelViewModel = Modular.get();

    List<Widget> formBody = _getSearchHotelsInputs(
      context,
      searchHotelViewModel,
    );

    formBody.add(_searchButton(searchHotelViewModel));

    return Form(
      child: ListView(
        children: formBody,
      ),
    );
  }

  List<Widget> _getSearchHotelsInputs(
    BuildContext context,
    SearchHotelViewModel searchHotelViewModel,
  ) {
    const EdgeInsets padding = EdgeInsets.all(20);

    return [
      Padding(
        padding: padding,
        child: Center(
          child: _typeaheadWidget(
            context,
            searchHotelViewModel,
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: _checkInOutRowWidget(context, searchHotelViewModel),
      ),
      Padding(
        padding: padding,
        child: Center(
          child: TextFormFieldCustom(
            keyboardType: TextInputType.number,
            hintText: 'Número de adultos',
            onChanged: searchHotelViewModel.onChangeAdults,
            prefixIcon: Icon(Icons.person),
            validator: (_) {
              return !searchHotelViewModel.isValidAdults()
                  ? 'Preencha o número de adultos'
                  : null;
            },
          ),
        ),
      ),
    ];
  }

  Widget _searchButton(SearchHotelViewModel searchHotelViewModel) {
    final CategoryHotelViewModel categoryHotelViewModel = Modular.get();

    return Container(
      margin: const EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 20),
      child: SearchFormButton(
        categoryViewModel: categoryHotelViewModel,
        searchViewModel: searchHotelViewModel,
      ),
    );
  }

  Widget _typeaheadWidget(
      BuildContext context, SearchHotelViewModel searchHotelViewModel) {
    TextEditingController destinyController = TextEditingController();
    TypeAheadField typeaheadField = TypeAheadField(
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
    );

    return typeaheadField;
  }

  Widget _checkInOutRowWidget(
      BuildContext context, SearchHotelViewModel searchHotelViewModel) {
    TextEditingController checkInController = TextEditingController();
    TextEditingController checkOutController = TextEditingController();
    Widget rowCheckinOut = Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: DatePickerField(
              hintText: 'check in',
              onChangeFormatter: "yyyy-MM-dd",
              onChanged: searchHotelViewModel.onChangeCheckIn,
              controller: checkInController,
              validator: (_) {
                return !searchHotelViewModel.isValidCheckIn()
                    ? 'Preencha o check in'
                    : null;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: DatePickerField(
              hintText: 'check out',
              onChangeFormatter: "yyyy-MM-dd",
              onChanged: searchHotelViewModel.onChangeCheckOut,
              controller: checkOutController,
              validator: (_) {
                return !searchHotelViewModel.isValidCheckOut()
                    ? 'Preencha o check out'
                    : null;
              },
            ),
          ),
        ),
      ],
    );

    return rowCheckinOut;
  }
}
