import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/repositories/hotel_city_repository.dart';
import 'package:travel_agency_front/app/view_data/hotel_search_view_data.dart';

part 'search_hotel_view_model.g.dart';

class SearchHotelViewModel = _FlightBase with _$SearchHotelViewModel;

abstract class _FlightBase with Store {
  @observable
  int adults = 1;

  @observable
  String checkIn = DateTime.now().toString();

  @observable
  String checkOut = DateTime.now().toString();

  @observable
  String destiny = "São Paulo";

  @action
  void onChangeAdults(adults) {
    this.adults = adults;
  }

  @action
  void onChangeCheckIn(checkIn) {
    this.checkIn = checkIn;
  }

  @action
  void onChangeDestiny(destiny) {
    this.destiny = destiny;
  }

  @action
  void onChangeCheckOut(checkOut) {
    this.checkOut = checkOut;
  }

  HotelSearchViewData getHotels() {
    return HotelSearchViewData(
      adults: this.adults,
      checkIn: this.checkIn,
      checkOut: this.checkOut,
      destiny: this.destiny,
    );
  }

  Future<List<String>> onTypeAhead(String type) async {
    final HotelCityRepository repository = Modular.get();

    final result = await repository.getCities(type);
    return result.success ?? [];
  }
}
