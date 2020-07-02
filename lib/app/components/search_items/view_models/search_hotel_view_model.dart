import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/interfaces/search_view_model_interface.dart';
import 'package:travel_agency_front/app/repositories/hotel_city_repository.dart';
import 'package:travel_agency_front/app/view_data/hotel_search_view_data.dart';

part 'search_hotel_view_model.g.dart';

class SearchHotelViewModel = _SearchHotelBase with _$SearchHotelViewModel;

abstract class _SearchHotelBase with Store implements SearchViewModelInterface {
  @observable
  int adults;

  @observable
  String checkIn;

  @observable
  String checkOut;

  @observable
  String destiny;

  @computed
  bool get isValidForm =>
      isValidAdults() &&
      isValidCheckIn() &&
      isValidCheckOut() &&
      isValidDestiny();

  @action
  void onChangeAdults(String adults) {
    this.adults = int.parse(adults);
  }

  @action
  void onChangeCheckIn(String checkIn) {
    this.checkIn = checkIn;
  }

  @action
  void onChangeDestiny(String destiny) {
    this.destiny = destiny;
  }

  @action
  void onChangeCheckOut(String checkOut) {
    this.checkOut = checkOut;
  }

  bool isValidCheckOut() {
    return this.checkOut != null;
  }

  bool isValidCheckIn() {
    return this.checkIn != null;
  }

  bool isValidDestiny() {
    return this.destiny != null;
  }

  bool isValidAdults() {
    return this.adults != null;
  }

  HotelSearchViewData getSearchData() {
    return HotelSearchViewData(
      adults: this.adults,
      checkIn: this.checkIn,
      checkOut: this.checkOut,
      destiny: this.destiny,
    );
  }

  Future<List<dynamic>> onTypeAhead(String type) async {
    final HotelCityRepository repository = Modular.get();

    final result = await repository.getCities(type);
    return result.success ?? [];
  }
}
