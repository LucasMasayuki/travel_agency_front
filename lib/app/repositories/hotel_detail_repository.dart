import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/models/hotel_details_model.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';

class HotelRepository extends Disposable {
  ApiService apiService = Modular.get();
  Future<RepositoryResult<HotelDetailsModel, String>> getHotelDetails(
    int hotelId,
    int adults,
    String checkIn,
    String checkOut,
  ) async {
    try {
      final response = await apiService.get('/hotelDetails', queryParameters: {
        'hotelId': hotelId,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'adults': adults,
        'currency': "BRL",
      });

      if (response.statusCode != 200) {
        return RepositoryResult(
            null, response.statusMessage ?? 'unknown error');
      }

      HotelDetailsModel hotelDetail = HotelDetailsModel.fromJson(response.data);

      return RepositoryResult(hotelDetail, null);
    } on DioError catch (e) {
      print(e.request.uri);
      return RepositoryResult(null, e.toString());
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
