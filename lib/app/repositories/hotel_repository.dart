import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/models/hotel_model.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';

class HotelRepository extends Disposable {
  ApiService apiService = Modular.get();
  Future<RepositoryResult<List<HotelModel>, String>> getNotifications({
    int destinationId,
    int pageNumber,
    String checkIn,
    String checkOut,
    int adults1,
    int pageSize = 25,
    String sortOrder = "PRICE",
  }) async {
    try {
      final response = await apiService.get('/listHotels', queryParameters: {
        'destinationId': destinationId,
        'pageNumber': pageNumber,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'adults1': adults1,
        'pageSize': pageSize,
        'sortOrder': sortOrder,
      });

      if (response.data['status'] != 'success') {
        return RepositoryResult(
            null, response.data['message'] ?? 'unknown error');
      }
      List<HotelModel> hotels = (response.data['data'] as List)
          .map((n) => HotelModel.fromJson(n))
          .toList();

      return RepositoryResult(hotels, null);
    } catch (e) {
      return RepositoryResult(null, e.toString());
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
