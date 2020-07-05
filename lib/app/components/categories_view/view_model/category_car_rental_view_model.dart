import 'package:intl/intl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/item_card/car_rental_card.dart';
import 'package:travel_agency_front/app/interfaces/category_view_model_inferface.dart';
import 'package:travel_agency_front/app/models/car_rental_model.dart';
import 'package:travel_agency_front/app/repositories/car_rental_repository.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';
import 'package:travel_agency_front/app/view_data/car_rental_search_view_data.dart';
import 'package:travel_agency_front/app/view_data/car_rental_view_data.dart';

part 'category_car_rental_view_model.g.dart';

class CategoryCarRentalViewModel = _CategoriesCarRentalBase
    with _$CategoryCarRentalViewModel;

abstract class _CategoriesCarRentalBase
    with Store
    implements CategoryViewModelInterface {
  @observable
  List<CarRentalCard> carRentalViewData = [];

  @observable
  bool initialized = false;

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
    initialized = true;

    return loadCategoryData(carRental);
  }

  @action
  Future<void> loadCategoryData(RowViewDataAbstract carRental) async {
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
        carRental: CarRentalViewData(carRental: item),
      );
    }));

    return viewDataList;
  }

  CarRentalSearchViewData _getInitialCarRental() {
    DateTime now = DateTime.now();
    DateTime fifthDaysAfterNow = DateTime.now().add(Duration(days: 15));
    String formatedWithdrawalDate = DateFormat('dd-MM-yyyy').format(now);
    String formatedReturnDate =
        DateFormat('dd-MM-yyyy').format(fifthDaysAfterNow);

    return CarRentalSearchViewData(
      location: "Ciudad Guayana, Bolívar, Venezuela",
      returnDate: formatedReturnDate,
      withdrawalDate: formatedWithdrawalDate,
    );
  }
}
