import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_steps_view_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';
import 'package:travel_agency_front/app/view_data/car_rental_view_data.dart';
import 'package:travel_agency_front/app/view_data/flight_view_data.dart';
import 'package:travel_agency_front/app/view_data/room_view_data.dart';

class CheckoutItemWidget extends StatefulWidget {
  final RowViewDataAbstract item;
  const CheckoutItemWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  _CheckoutItemWidgetState createState() => _CheckoutItemWidgetState();
}

class _CheckoutItemWidgetState extends State<CheckoutItemWidget> {
  final CheckoutStepsViewModel checkoutStepsViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    RowViewDataAbstract item = this.widget.item;
    Widget itemDescriptionWidget = Container();
    if (item is FlightViewData) {
      itemDescriptionWidget = buildDescriptionOfFlight(item);
    } else if (item is RoomViewData) {
      itemDescriptionWidget = buildDescriptionOfHotel(item);
    } else if (item is CarRentalViewData) {
      itemDescriptionWidget = buildDescriptionOfCarRental(item);
    }

    return itemDescriptionWidget;
  }

  Widget titleRow() {
    RowViewDataAbstract item = this.widget.item;
    Widget titleRow = Row(
      children: [
        Expanded(
          child: item.cartIcon,
          flex: 1,
        ),
        Expanded(
          child: Text(
            item.cartTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          flex: 2,
        ),
      ],
    );

    return titleRow;
  }

  Widget subTitleRow(String subtitle) {
    Widget titleRow = Text(
      subtitle,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );

    return titleRow;
  }

  Widget descriptionRow(String label, String value) {
    Widget descriptionRow = Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
    return descriptionRow;
  }

  Widget space() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, top: 20),
    );
  }

  Widget buildDescriptionOfHotel(RoomViewData item) {
    Widget descriptionRoom = Column(
      children: [
        titleRow(),
        subTitleRow("Informações do quarto"),
        space(),
        descriptionRow("Nome: ", item.name),
        descriptionRow("Opções de cama: ", item.bedOptions),
        descriptionRow("Acomodação: ", item.totalPeopleMessage),
        space(),
        subTitleRow("Preço"),
        descriptionRow("Total: ", item.totalPrice),
      ],
    );

    return descriptionRoom;
  }

  Widget buildDescriptionOfFlight(FlightViewData item) {
    Widget descriptionFlight = Column(
      children: [
        titleRow(),
        space(),
        subTitleRow("Informações de ida"),
        descriptionRow("De: ", item.goingOrigin),
        descriptionRow("Para: ", item.goingDestiny),
        descriptionRow("Companhia: ", item.goingCompany),
        descriptionRow("Horario decolagem: ", item.goingTakeOffTime),
        space(),
        subTitleRow("Informações da volta"),
        descriptionRow("De: ", item.backOrigin),
        descriptionRow("Para: ", item.backDestiny),
        descriptionRow("Companhia: ", item.backCompany),
        descriptionRow("Horario decolagem: ", item.backTakeOffTime),
        space(),
        subTitleRow("Preço"),
        descriptionRow("Total: ", item.total),
      ],
    );

    return descriptionFlight;
  }

  Widget buildDescriptionOfCarRental(CarRentalViewData item) {
    Widget descriptionFlight = Column(
      children: [
        titleRow(),
        space(),
        subTitleRow("Informações sobre o carro"),
        descriptionRow("Modelo: ", item.car.model),
        descriptionRow("Cassificação: ", item.car.classification),
        descriptionRow(
          "Número de passageiros: ",
          item.car.quantityPassengers.toString(),
        ),
        descriptionRow("Tipo de cambio: ", item.car.changeType),
        descriptionRow("Ar condicionado: ", item.car.changeType),
        space(),
        subTitleRow("Informações do aluguel"),
        descriptionRow("Local de retirada: ", item.placeWithdrawn),
        descriptionRow("Empresa: ", item.company),
        space(),
        subTitleRow("Preço"),
        descriptionRow("Total: ", item.total.toString()),
      ],
    );

    return descriptionFlight;
  }
}
