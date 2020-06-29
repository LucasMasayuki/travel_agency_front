import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/models/flight_model.dart';
import 'package:travel_agency_front/app/services/api_soap_service.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';
import 'package:travel_agency_front/app/view_data/car_rental_search_view_data.dart';

class CarRentalRepository extends Disposable {
  ApiSoapService apiSoapService = Modular.get();

  Future<RepositoryResult<List<FlightModel>, String>> getCarRentals(
      CarRentalSearchViewData carRental) async {
    String envelope = _getFormattedEnvelpe(carRental);
    try {
      final response =
          await apiSoapService.get('/ws/carrentoffer.wsdl', envelope);

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

  String _getFormattedEnvelpe(CarRentalSearchViewData carRental) {
    String envelope = '''
      <?xml version="1.0" encoding="utf-8"?>
      https://voyage-dsid.herokuapp.com/ws/carrentoffer.wsdl

      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:gs="http://voyage.com/carrentoffers">
        <soapenv:Header/>
        <soapenv:Body>
            <gs:getCarRentRequest>
              <gs:cidade>${carRental.location}</gs:cidade>
              <gs:dataRetirada>${carRental.withdrawalDate}</gs:dataRetirada>
              <gs:dataDevolucao>${carRental.returnDate}</gs:dataDevolucao>
            </gs:getCarRentRequest>
        </soapenv:Body>
      </soapenv:Envelope>
    ''';

    return envelope;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
