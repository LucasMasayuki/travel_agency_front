import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/buttons/go_to_checkout_button.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';
import 'package:travel_agency_front/app/view_data/flight_view_data.dart';

class FlightCard extends StatelessWidget {
  final FlightViewData flight;
  const FlightCard({
    Key key,
    @required this.flight,
  }) : super(key: key);

  List<Widget> getCardBody(BuildContext context) {
    final bool isMobile = MediaHelper.isMobile(context);
    List<Widget> cardBody = [];

    Widget titleWidget = _getTitleWidget(isMobile);

    Widget descriptionWidget = _getDescriptionWidget(isMobile);

    cardBody.add(Expanded(
      child: titleWidget,
      flex: 1,
    ));

    cardBody.add(Expanded(
      child: descriptionWidget,
      flex: 6,
    ));

    cardBody.add(Expanded(
      child: _getTotalPriceWithButton(isMobile),
      flex: 1,
    ));

    return cardBody;
  }

  Widget _getTotalPriceWithButton(bool isMobile) {
    Widget button = GoToCheckoutButton(
      onPurchase: () => Modular.to.pushNamed('/checkout', arguments: flight),
    );

    Widget totalPriceWithButtonWidget = Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    "Valor total: ",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'R\$ ${flight.total}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          button,
        ],
      ),
    );

    return totalPriceWithButtonWidget;
  }

  Widget _getDescriptionWidget(bool isMobile) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _getGoingBackInformationsWidget(isMobile, true)),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          Expanded(child: _getGoingBackInformationsWidget(isMobile, false)),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          Expanded(child: _getPriceWidget(isMobile)),
        ],
      ),
    );
  }

  Widget _getPriceWidget(bool isMobile) {
    Widget priceWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Text(
            "Preços",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Valor por criança: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'R\$ ${flight.valuePerChild}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Valor por adulto: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'R\$ ${flight.valuePerAdult}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return priceWidget;
  }

  Widget _getGoingBackInformationsWidget(bool isMobile, bool isGoing) {
    Widget goingInformationWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Text(
            "Informações da ${isGoing ? "ida" : "volta"}",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Local de embarque: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  isGoing ? flight.goingOrigin : flight.backOrigin,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Destino: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  isGoing ? flight.goingDestiny : flight.backDestiny,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Duração voo: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  isGoing ? flight.goingDuration : flight.backDuration,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Horario da decolagem: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  isGoing ? flight.goingTakeOffTime : flight.backTakeOffTime,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Horario da aterrissagem: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  isGoing ? flight.goingLandingTime : flight.backLandingTime,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  "Companhia: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  isGoing ? flight.goingCompany : flight.backCompany,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return goingInformationWidget;
  }

  Widget _getTitleWidget(bool isMobile) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'De ${flight.goingOrigin} para ${flight.goingDestiny}',
          style: TextStyle(
            fontSize: isMobile ? 16 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardBody = getCardBody(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 250,
        height: double.infinity,
        child: Column(
          children: cardBody,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
