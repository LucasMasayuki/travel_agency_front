class HotelModel {
  int id;
  String name;
  String neighborhoodCity;
  int stars;
  String score;
  String pricePerNight;
  String total;

  HotelModel({
    id,
    name,
    neighborhoodCity,
    stars,
    score,
    pricePerNight,
    total,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json["id"],
      name: json["nome"],
      neighborhoodCity: json["bairroCidade"],
      stars: json["estrelas"],
      score: json["nota"],
      pricePerNight: json["precoNoite"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {};
}
