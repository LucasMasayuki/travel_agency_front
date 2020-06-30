class CarModel {
  String model;
  String classification;
  int quantityPassengers;
  int doorsQuantity;
  int largeSuitcasesQuantity;
  String changeType;
  bool airConditioning;
  String photo;

  CarModel();

  CarModel.fromJson(Map<String, dynamic> json) {
    model = json["modelo"];
    classification = json["cassificacao"];
    quantityPassengers = json["quantidadePassageiros"];
    doorsQuantity = json["quantidadePortas"];
    largeSuitcasesQuantity = json["quantidadeMalasGrandes"];
    changeType = json["tipoCambio"];
    airConditioning = json["arCondicionado"];
    photo = json["foto"];
  }

  Map<String, dynamic> toJson() => {};
}
