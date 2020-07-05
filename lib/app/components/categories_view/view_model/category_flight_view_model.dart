import 'package:intl/intl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/item_card/flight_card.dart';
import 'package:travel_agency_front/app/interfaces/category_view_model_inferface.dart';
import 'package:travel_agency_front/app/models/flight_model.dart';
import 'package:travel_agency_front/app/repositories/flight_repository.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';
import 'package:travel_agency_front/app/view_data/flight_search_view_data.dart';
import 'package:travel_agency_front/app/view_data/flight_view_data.dart';

part 'category_flight_view_model.g.dart';

class CategoryFlightViewModel = _CategoryFlightBase
    with _$CategoryFlightViewModel;

abstract class _CategoryFlightBase
    with Store
    implements CategoryViewModelInterface {
  @observable
  List<FlightCard> flightViewData = [];

  @observable
  bool initialized = false;

  @observable
  bool isLoading = true;

  @observable
  String errorMessage;

  @computed
  bool get isEmptyPage => flightViewData.isEmpty;

  @computed
  bool get hasError =>
      !isLoading && errorMessage != null && errorMessage.isNotEmpty;

  @action
  Future<void> initialize() async {
    FlightSearchViewData flight = _getInitialFlight();
    initialized = true;

    return loadCategoryData(flight);
  }

  @action
  Future<void> loadCategoryData(RowViewDataAbstract flight) async {
    final FlightRepository repository = Modular.get();

    isLoading = true;
    final result = await repository.getFlights(flight);
    final viewDataList = _buildViewData(result.success ?? []);

    flightViewData.addAll(viewDataList);
    errorMessage = result.error;
    isLoading = false;
  }

  List<FlightCard> _buildViewData(List<FlightModel> flight) {
    if (flight.isEmpty) {
      return [];
    }

    var viewDataList = <FlightCard>[];

    viewDataList.addAll(flight.map((item) {
      return FlightCard(flight: FlightViewData(flight: item));
    }));

    return viewDataList;
  }

  FlightSearchViewData _getInitialFlight() {
    DateTime now = DateTime.now();
    DateTime fifthDaysAfterNow = DateTime.now().add(Duration(days: 15));
    String formatedDepartureDate = DateFormat('yyyy-MM-dd').format(now);
    String formatedReturneDate =
        DateFormat('yyyy-MM-dd').format(fifthDaysAfterNow);

    return FlightSearchViewData(
      adults: 1,
      children: 1,
      departureDate: formatedDepartureDate,
      returnDate: formatedReturneDate,
      destiny: "Posadas, Misiones, Argentina",
      origin: "Rio de Janeiro, Rio de Janeiro, Brasil",
    );
  }
}
