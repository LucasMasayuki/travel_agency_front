import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_steps_view_model.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';
import 'package:travel_agency_front/app/view_data/car_rental_view_data.dart';
import 'package:travel_agency_front/app/view_data/flight_view_data.dart';
import 'package:travel_agency_front/app/view_data/hotel_view_data.dart';

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
    } else if (item is HotelViewData) {
    } else if (item is CarRentalViewData) {
      itemDescriptionWidget = buildDescriptionOfCarRental(item);
    }

    return itemDescriptionWidget;
  }

  Widget titleRow() {
    RowViewDataAbstract item = this.widget.item;
    Widget titleRow = Wrap(
      direction: Axis.horizontal,
      spacing: 10,
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
    Widget titleRow = Wrap(direction: Axis.horizontal, spacing: 10, children: [
      Text(
        subtitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);

    return titleRow;
  }

  Widget descriptionRow(String label, String value) {
    Widget descriptionRow = Wrap(
      direction: Axis.horizontal,
      spacing: 10,
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

  Widget buildDescriptionOfFlight(FlightViewData item) {
    Widget descriptionFlight = Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      children: [
        titleRow(),
        subTitleRow("Informações de ida"),
        descriptionRow("De: ", item.goingOrigin),
        descriptionRow("Para: ", item.goingDestiny),
        descriptionRow("Companhia: ", item.goingCompany),
        descriptionRow("Horario decolagem: ", item.goingTakeOffTime),
        subTitleRow("Informações da volta"),
        descriptionRow("De: ", item.backOrigin),
        descriptionRow("Para: ", item.backDestiny),
        descriptionRow("Companhia: ", item.backCompany),
        descriptionRow("Horario decolagem: ", item.backTakeOffTime),
        subTitleRow("Preço"),
        descriptionRow("Total: ", item.total),
      ],
    );

    return descriptionFlight;
  }

  Widget buildDescriptionOfCarRental(CarRentalViewData item) {
    Widget descriptionFlight = Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        titleRow(),
        subTitleRow("Informações sobre o carro"),
        descriptionRow("Modelo: ", item.car.model),
        descriptionRow("Cassificação: ", item.car.classification),
        descriptionRow(
          "Número de passageiros: ",
          item.car.quantityPassengers.toString(),
        ),
        descriptionRow("Tipo de cambio: ", item.car.changeType),
        descriptionRow("Ar condicionado: ", item.car.changeType),
        subTitleRow("Informações do aluguel"),
        descriptionRow("Local de retirada: ", item.placeWithdrawn),
        descriptionRow("Empresa: ", item.company),
        subTitleRow("Preço"),
        descriptionRow("Total: ", item.total.toString()),
      ],
    );

    return descriptionFlight;
  }
}
