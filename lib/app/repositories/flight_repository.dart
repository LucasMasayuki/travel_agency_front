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
        'destiny': flight.destiny,
        'origin': flight.origin,
      });

      if (response.data['status'] != 'success') {
        return RepositoryResult(
            null, response.data['message'] ?? 'unknown error');
      }

      List<FlightModel> flights = (response.data['data'] as List)
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
