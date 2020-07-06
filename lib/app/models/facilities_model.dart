class FacilitiesModel {
  String heading;
  List<dynamic> listOfFacilities;

  FacilitiesModel();

  FacilitiesModel.fromJson(Map<String, dynamic> json) {
    heading = json["heading"];
    listOfFacilities = json["listItems"];
  }

  Map<String, dynamic> toJson() => {};
}
