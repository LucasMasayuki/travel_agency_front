import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/interfaces/search_view_model_interface.dart';
import 'package:travel_agency_front/app/repositories/flight_city_repository.dart';
import 'package:travel_agency_front/app/view_data/flight_search_view_data.dart';

part 'search_flight_view_model.g.dart';

class SearchFlightViewModel = _SearchFlightBase with _$SearchFlightViewModel;

abstract class _SearchFlightBase
    with Store
    implements SearchViewModelInterface {
  @observable
  int adults;

  @observable
  int children;

  @observable
  String departureDate;

  @observable
  String returnDate;

  @observable
  String destiny;

  @observable
  String origin;

  @computed
  bool get isValidForm =>
      isValidAdults() &&
      isValidChildren() &&
      isValidDestiny() &&
      isValidOrigin() &&
      isValidDepartureDate() &&
      isValidReturnDate();

  @action
  void onChangeAdults(String adults) {
    this.adults = int.parse(adults);
  }

  @action
  void onChangeChildren(String children) {
    this.children = int.parse(children);
  }

  @action
  void onChangeDepartureDate(String departureDate) {
    this.departureDate = departureDate;
  }

  @action
  void onChangeReturnDate(String returnDate) {
    this.returnDate = returnDate;
  }

  @action
  void onChangeDestiny(String destiny) {
    this.destiny = destiny;
  }

  @action
  void onChangeOrigin(String origin) {
    this.origin = origin;
  }

  bool isValidAdults() {
    return this.adults != null && this.adults > 0;
  }

  bool isValidChildren() {
    return this.children != null && this.children > 0;
  }

  bool isValidDestiny() {
    return this.destiny != null && this.destiny.isNotEmpty;
  }

  bool isValidOrigin() {
    return this.origin != null && this.origin.isNotEmpty;
  }

  bool isValidDepartureDate() {
    return this.departureDate != null && this.departureDate.isNotEmpty;
  }

  bool isValidReturnDate() {
    return this.returnDate != null && this.returnDate.isNotEmpty;
  }

  FlightSearchViewData getSearchData() {
    return FlightSearchViewData(
      adults: this.adults,
      children: this.children,
      departureDate: this.departureDate,
      returnDate: this.returnDate,
      destiny: this.destiny,
      origin: this.origin,
    );
  }

  Future<List<dynamic>> onTypeAhead(String type) async {
    final FlightCityRepository repository = Modular.get();

    final result = await repository.getCities(type);
    return result.success ?? [];
  }
}
