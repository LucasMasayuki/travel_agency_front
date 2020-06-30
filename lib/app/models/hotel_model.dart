class HotelModel {
  int id;
  String name;
  String neighborhoodCity;
  int stars;
  String pricePerNight;
  String total;

  HotelModel();

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["nome"];
    neighborhoodCity = json["bairroCidade"];
    stars = json["estrelas"];
    pricePerNight = json["precoNoite"];
    total = json["precoTotal"];
  }

  Map<String, dynamic> toJson() => {};
}
