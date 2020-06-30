import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/view_data/flight_view_data.dart';

class FlightCard extends StatelessWidget {
  final FlightViewData flight;
  const FlightCard({
    Key key,
    @required this.flight,
  }) : super(key: key);

  List<Widget> getCardBody() {
    List<Widget> cardBody = [];

    Widget categoryNameWidget = Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          flight.backOrigin,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );

    Widget titleWidget = Container(
      margin: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          flight.backOrigin,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );

    Widget descriptionWidget = Container(
      height: 140,
      margin: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          flight.backOrigin,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );

    print(
      flight.backOrigin,
    );

    Widget priceWidget = Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      height: 40,
      margin: EdgeInsets.only(left: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A partir de",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "R\$ ${flight.backOrigin}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );

    cardBody.add(Expanded(
      child: categoryNameWidget,
      flex: 1,
    ));

    cardBody.add(Expanded(
      child: titleWidget,
      flex: 3,
    ));

    cardBody.add(Expanded(
      child: priceWidget,
      flex: 2,
    ));

    return cardBody;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardBody = getCardBody();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 2,
      child: Container(
        width: 250,
        child: Column(
          children: cardBody,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
