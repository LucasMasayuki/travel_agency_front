import 'package:travel_agency_front/app/models/car_model.dart';

class CarRentalModel {
  String company;
  String placeWithdrawn;
  double total;
  CarModel car;

  CarRentalModel();

  CarRentalModel.fromJson(Map<String, dynamic> json) {
    company = json["carOffer"]["empresa"];
    placeWithdrawn = json["carOffer"]["localRetirada"];
    total = json["carOffer"]["valorTotal"];
    car = CarModel.fromJson(json["carOffer"]["carro"]);
  }

  Map<String, dynamic> toJson() => {};
}
