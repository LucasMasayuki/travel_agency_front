import 'package:travel_agency_front/app/models/car_model.dart';

class CarRentalModel {
  String company;
  String placeWithdrawn;
  double total;
  CarModel car;

  CarRentalModel();

  CarRentalModel.fromJson(Map<String, dynamic> json) {
    company = json["empresa"];
    placeWithdrawn = json["localRetirada"];
    total = json["valorTotal"];
    car = CarModel.fromJson(json["carro"]);
  }

  Map<String, dynamic> toJson() => {};
}
