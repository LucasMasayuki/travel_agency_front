import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/models/hotel_model.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';
import 'package:travel_agency_front/app/view_data/hotel_search_view_data.dart';

class HotelRepository extends Disposable {
  ApiService apiService = Modular.get();
  Future<RepositoryResult<List<HotelModel>, String>> getHotels(
      HotelSearchViewData hotel) async {
    try {
      final response = await apiService.get('/listHotels', queryParameters: {
        'destiny': hotel.destiny,
        'checkIn': hotel.checkIn,
        'checkOut': hotel.checkOut,
        'adults1': hotel.adults,
        'pageNumber': 1,
        'pageSize': 25,
        'sortOrder': "PRICE",
        'currency': "BRL",
      });

      if (response.statusCode != 200) {
        return RepositoryResult(
            null, response.statusMessage ?? 'unknown error');
      }

      List<HotelModel> hotels = (response.data["hoteis"] as List)
          .map((hotel) => HotelModel.fromJson(hotel))
          .toList();

      return RepositoryResult(hotels, null);
    } on DioError catch (e) {
      return RepositoryResult(null, e.toString());
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
