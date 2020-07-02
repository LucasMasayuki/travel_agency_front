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
  String destiny;

  @observable
  String origin;

  @computed
  bool get isValidForm =>
      isValidAdults() &&
      isValidChildren() &&
      isValidDestiny() &&
      isValidOrigin() &&
      isValidDepartureDate();

  @action
  void onChangeAdults(adults) {
    this.adults = adults;
  }

  @action
  void onChangeChildren(children) {
    this.children = children;
  }

  @action
  void onChangeDepartureDate(departureDate) {
    this.departureDate = departureDate;
  }

  @action
  void onChangeDestiny(destiny) {
    this.destiny = destiny;
  }

  @action
  void onChangeOrigin(origin) {
    this.origin = origin;
  }

  bool isValidAdults() {
    return this.adults != null;
  }

  bool isValidChildren() {
    return this.children != null;
  }

  bool isValidDestiny() {
    return this.destiny != null;
  }

  bool isValidOrigin() {
    return this.origin != null;
  }

  bool isValidDepartureDate() {
    return this.departureDate != null;
  }

  FlightSearchViewData getSearchData() {
    return FlightSearchViewData(
      adults: this.adults,
      children: this.children,
      departureDate: this.departureDate,
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
