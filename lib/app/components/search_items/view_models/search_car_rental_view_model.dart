import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/repositories/flight_city_repository.dart';
import 'package:travel_agency_front/app/view_data/car_rental_search_view_data.dart';

part 'search_car_rental_view_model.g.dart';

class SearchCarRentalViewModel = _SearchCarRentalBase
    with _$SearchCarRentalViewModel;

abstract class _SearchCarRentalBase with Store {
  @observable
  String location = "São Paulo";

  @observable
  String returnDate = DateTime.now().toString();

  @observable
  String withdrawalDate = DateTime.now().toString();

  @action
  void onChangeLocation(location) {
    this.location = location;
  }

  @action
  void onChangeReturnDate(returnDate) {
    this.returnDate = returnDate;
  }

  @action
  void onChangeWithdrawalDate(withdrawalDate) {
    this.withdrawalDate = withdrawalDate;
  }

  CarRentalSearchViewData getCarRental() {
    return CarRentalSearchViewData(
      location: this.location,
      returnDate: this.returnDate,
      withdrawalDate: this.withdrawalDate,
    );
  }

  Future<List<dynamic>> onTypeAhead(String type) async {
    final FlightCityRepository repository = Modular.get();

    final result = await repository.getCities(type);
    return result.success ?? [];
  }
}
