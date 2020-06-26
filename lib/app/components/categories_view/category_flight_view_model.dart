import 'package:intl/intl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/categories_view/categories_view_model.dart';
import 'package:travel_agency_front/app/models/flight_model.dart';
import 'package:travel_agency_front/app/repositories/flight_repository.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';
import 'package:travel_agency_front/app/view_data/flight_search_view_data.dart';
import 'package:travel_agency_front/app/view_data/flight_view_data.dart';

part 'category_flight_view_model.g.dart';

class CategoryFlightViewModel = _CategoriesBase with _$CategoryFlightViewModel;

abstract class _CategoriesBase with Store {
  final CategoriesViewModel categoriesViewModel = Modular.get();

  @observable
  List<RowViewDataAbstract> flightViewData = [];

  @observable
  String errorMessage;

  @computed
  bool get isEmptyPage => flightViewData.isEmpty;

  @computed
  bool get hasError =>
      !categoriesViewModel.isLoading &&
      errorMessage != null &&
      errorMessage.isNotEmpty;

  @action
  Future<void> initialize() async {
    final FlightRepository repository = Modular.get();
    FlightSearchViewData flight = _getInitialFlight();

    final result = await repository.getFlights(flight);
    final viewDataList = _buildViewData(result.success ?? []);

    flightViewData.addAll(viewDataList);
    errorMessage = result.error;
    print(errorMessage);
    print(viewDataList);
  }

  @action
  Future<void> loadFlights(FlightSearchViewData flight) async {
    final FlightRepository repository = Modular.get();

    categoriesViewModel.isLoading = true;
    final result = await repository.getFlights(flight);
    final viewDataList = _buildViewData(result.success ?? []);

    flightViewData.addAll(viewDataList);
    errorMessage = result.error;
    categoriesViewModel.isLoading = false;
  }

  List<RowViewDataAbstract> _buildViewData(List<FlightModel> flight) {
    if (flight.isEmpty) {
      return [];
    }

    var viewDataList = <RowViewDataAbstract>[];

    viewDataList.addAll(flight.map((item) {
      return FlightViewData(flight: item);
    }));

    return viewDataList;
  }

  FlightSearchViewData _getInitialFlight() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
    return FlightSearchViewData(
      adults: 1,
      children: 1,
      departureDate: formattedDate,
      destiny: "São Paulo",
      origin: "Buenos Aires",
    );
  }
}
