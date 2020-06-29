import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/repositories/flight_city_repository.dart';
import 'package:travel_agency_front/app/view_data/flight_search_view_data.dart';

part 'search_flight_view_model.g.dart';

class SearchFlightViewModel = _SearchFlightBase with _$SearchFlightViewModel;

abstract class _SearchFlightBase with Store {
  @observable
  int adults = 1;

  @observable
  int children = 1;

  @observable
  String departureDate = DateTime.now().toString();

  @observable
  String destiny = "São Paulo";

  @observable
  String origin = "Buenos Aires";

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

  FlightSearchViewData getFlight() {
    return FlightSearchViewData(
      adults: this.adults,
      children: this.children,
      departureDate: this.departureDate,
      destiny: this.destiny,
      origin: this.origin,
    );
  }

  Future<List<String>> onTypeAhead(String type) async {
    final FlightCityRepository repository = Modular.get();

    final result = await repository.getCities(type);
    return result.success ?? [];
  }
}
