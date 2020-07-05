import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/services/api_service.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';

class EmailRepository extends Disposable {
  ApiService apiService = Modular.get();

  Future<RepositoryResult<String, String>> sendEmail(
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await apiService.post(
        '/sendEmail',
        data: data,
      );

      if (response.statusCode != 200) {
        return RepositoryResult(
            null, response.statusMessage ?? 'unknown error');
      }

      return RepositoryResult("success", null);
    } catch (e) {
      return RepositoryResult(null, e.toString());
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
