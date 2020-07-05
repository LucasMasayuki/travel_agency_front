import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/models/flight_model.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';
import 'package:travel_agency_front/app/view_data/flight_search_view_data.dart';

class FlightRepository extends Disposable {
  ApiService apiService = Modular.get();

  Future<RepositoryResult<List<FlightModel>, String>> getFlights(
      FlightSearchViewData flight) async {
    try {
      final response = await apiService.get('/flights', queryParameters: {
        'adults': flight.adults,
        'children': flight.children,
        'departureDate': flight.departureDate,
        'returnDate': flight.returnDate,
        'destiny': flight.destiny,
        'origin': flight.origin,
        'maxPrice': 99999,
        'infants': 1,
      });

      if (response.statusCode != 200) {
        return RepositoryResult(
            null, response.statusMessage ?? 'unknown error');
      }

      List<FlightModel> flights = (response.data as List)
          .map((flight) => FlightModel.fromJson(flight))
          .toList();

      return RepositoryResult(flights, null);
    } catch (e) {
      return RepositoryResult(null, e.toString());
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
