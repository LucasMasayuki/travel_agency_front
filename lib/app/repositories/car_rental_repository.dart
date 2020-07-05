import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/models/car_rental_model.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';
import 'package:travel_agency_front/app/view_data/car_rental_search_view_data.dart';

class CarRentalRepository extends Disposable {
  ApiService apiService = Modular.get();

  Future<RepositoryResult<List<CarRentalModel>, String>> getCarRentals(
    CarRentalSearchViewData carRental,
  ) async {
    try {
      final response = await apiService.get(
        '/carRent',
        queryParameters: {
          'dataDevolucao': carRental.returnDate,
          'dataRetirada': carRental.withdrawalDate,
          'cidade': carRental.location,
        },
      );

      if (response.statusCode != 200) {
        return RepositoryResult(
            null, response.statusMessage ?? 'unknown error');
      }

      var list = response.data["carRentResponse"]["carOffer"];

      List<CarRentalModel> carRentals = (list as List)
          .map((carRentalInfo) => CarRentalModel.fromJson(carRentalInfo))
          .toList();

      return RepositoryResult(carRentals, null);
    } catch (e) {
      return RepositoryResult(null, e.toString());
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
