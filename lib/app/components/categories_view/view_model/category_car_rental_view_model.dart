import 'package:intl/intl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/item_card/car_rental_card.dart';
import 'package:travel_agency_front/app/models/car_rental_model.dart';
import 'package:travel_agency_front/app/repositories/car_rental_repository.dart';
import 'package:travel_agency_front/app/view_data/car_rental_search_view_data.dart';
import 'package:travel_agency_front/app/view_data/car_rental_view_data.dart';

part 'category_car_rental_view_model.g.dart';

class CategoryCarRentalViewModel = _CategoriesCarRentalBase
    with _$CategoryCarRentalViewModel;

abstract class _CategoriesCarRentalBase with Store {
  @observable
  List<CarRentalCard> carRentalViewData = [];

  @observable
  bool isLoading = true;

  String errorMessage;

  @computed
  bool get isEmptyPage => carRentalViewData.isEmpty;

  @computed
  bool get hasError =>
      isLoading && errorMessage != null && errorMessage.isNotEmpty;

  @action
  Future<void> initialize() {
    CarRentalSearchViewData carRental = _getInitialCarRental();

    return loadCarRentals(carRental);
  }

  @action
  Future<void> loadCarRentals(CarRentalSearchViewData carRental) async {
    final CarRentalRepository repository = Modular.get();

    isLoading = true;
    final result = await repository.getCarRentals(carRental);
    final viewDataList = _buildViewData(result.success ?? []);

    carRentalViewData.addAll(viewDataList);
    errorMessage = result.error;
    isLoading = false;
  }

  List<CarRentalCard> _buildViewData(List<CarRentalModel> carRental) {
    if (carRental.isEmpty) {
      return [];
    }

    var viewDataList = <CarRentalCard>[];

    viewDataList.addAll(carRental.map((item) {
      return CarRentalCard(
        cardRental: CarRentalViewData(carRental: item),
      );
    }));

    return viewDataList;
  }

  CarRentalSearchViewData _getInitialCarRental() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return CarRentalSearchViewData(
      location: "São Paulo, São Paulo, Brasil",
      returnDate: formattedDate,
      withdrawalDate: formattedDate,
    );
  }
}
