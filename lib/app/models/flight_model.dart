class FlightModel {
  String goingDuration;
  String goingDestiny;
  String goingOrigin;
  String goingTakeOffTime;
  String goingLandingTime;
  String goingCompany;
  List goingScales;
  String backDuration;
  String backDestiny;
  String backOrigin;
  String backTakeOffTime;
  String backLandingTime;
  String backCompany;
  List backScales;
  List total;
  String valuePerAdult;
  String valuePerChild;
  String valuePerLapChild;
  int quantityOfCheckedBaggage;

  FlightModel({
    goingDuration,
    goingDestiny,
    goingOrigin,
    goingTakeOffTime,
    goingLandingTime,
    goingCompany,
    goingScales,
    backDuration,
    backDestiny,
    backOrigin,
    backTakeOffTime,
    backLandingTime,
    backCompany,
    backScales,
    total,
    valuePerAdult,
    valuePerChild,
    valuePerLapChild,
    quantityOfCheckedBaggage,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    Map<int, String> going = json[0].value;
    Map<int, String> returnMap = json[1].value;
    Map<int, String> tariff = json[2].value;
    var ass = going["duracao"];
    return FlightModel(
      goingDuration: json["ida"]["duracao"],
      goingOrigin: json["ida"]["origem"],
      goingDestiny: json["ida"]["destino"],
      goingTakeOffTime: json["ida"]["horarioDecolagem"],
      goingLandingTime: json["ida"]["horarioAterrissagem"],
      goingCompany: json["ida"]["companhia"],
      goingScales: json["ida"]["escalas"],
      backDuration: json["volta"]["duracao"],
      backOrigin: json["volta"]["origem"],
      backDestiny: json["volta"]["destino"],
      backTakeOffTime: json["volta"]["horarioDecolagem"],
      backLandingTime: json["volta"]["horarioAterrissagem"],
      backCompany: json["volta"]["companhia"],
      backScales: json["volta"]["escalas"],
      total: json["tarifa"]["valorTotal"],
      valuePerAdult: json["tarifa"]["valorPorAdulto"],
      valuePerChild: json["tarifa"]["valorPorCrianca"],
      valuePerLapChild: json["tarifa"]["valorPorCriancaDeColo"],
      quantityOfCheckedBaggage: json["tarifa"]["quantidadeBagagemDespachada"],
    );
  }

  Map<String, dynamic> toJson() => {};
}
