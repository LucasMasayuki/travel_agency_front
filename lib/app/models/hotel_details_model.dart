import 'package:travel_agency_front/app/models/facilities_model.dart';
import 'package:travel_agency_front/app/models/room_model.dart';

class HotelDetailsModel {
  String name;
  String stars;
  String address;
  String completeCheckIn;
  String completeCheckOut;
  List<RoomModel> rooms;
  List<FacilitiesModel> hotelFacilities;
  List<FacilitiesModel> roomFacilities;

  HotelDetailsModel();

  HotelDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json["nome"];
    stars = json["estrelas"];
    address = json["endereco"];
    completeCheckIn = json["horarioCheckIn"];
    completeCheckOut = json["horarioCheckOut"];
    rooms = (json["quartos"] as List)
        .map((room) => RoomModel.fromJson(room))
        .toList();

    hotelFacilities = (json["facilidadesHotel"] as List)
        .map((facilities) => FacilitiesModel.fromJson(facilities))
        .toList();

    roomFacilities = (json["facilidadesQuarto"] as List)
        .map((facilities) => FacilitiesModel.fromJson(facilities))
        .toList();
  }

  Map<String, dynamic> toJson() => {};
}
