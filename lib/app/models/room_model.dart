class RoomModel {
  String name;
  String originalPhoto;
  String thumbnailPhoto;
  String bedOptions;
  String totalPeopleMessage;
  String roomtDescription;
  String pricePerNight;
  String totalPrice;

  RoomModel();

  RoomModel.fromJson(Map<String, dynamic> json) {
    name = json["nome"];
    originalPhoto = json["fotoOriginal"];
    thumbnailPhoto = json["fotoThumbnail"];
    bedOptions = json["opcoesCama"];
    totalPeopleMessage = json["mensagemTotalPessoas"];
    roomtDescription = json["descricaoQuarto"];
    pricePerNight = json["precoNoite"];
    totalPrice = json["precoTotal"];
  }

  Map<String, dynamic> toJson() => {};
}
