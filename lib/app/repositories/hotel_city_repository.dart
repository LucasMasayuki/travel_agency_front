import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/utils/city_respository_abstract.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';

class HotelCityRepository implements CityRepositoryAbstract {
  ApiService apiService = Modular.get();

  Future<RepositoryResult<List<String>, String>> getCities(String city) async {
    try {
      final response = await apiService.get('/citiesHotels', queryParameters: {
        'like': city,
      });

      if (response.statusCode != 200) {
        return RepositoryResult(
            null, response.statusMessage ?? 'unknown error');
      }

      List<String> cities = (response.data as List).toList();

      return RepositoryResult(cities, null);
    } catch (e) {
      return RepositoryResult(null, e.toString());
    }
  }
}
