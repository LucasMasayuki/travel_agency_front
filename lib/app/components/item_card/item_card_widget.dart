import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String photo;
  final String price;
  const ItemCardWidget(
      {Key key, @required this.title, this.photo, this.description, this.price})
      : super(key: key);

  List<Widget> getCardBody() {
    List<Widget> cardBody = [];

    if (photo != null) {
      cardBody.add(Container(
          child: Image(image: AssetImage(photo)),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          )));
    } else {
      cardBody.add(Container(
          width: 300,
          height: 140,
          child: Align(alignment: Alignment.center, child: Icon(Icons.image)),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          )));
    }

    Widget titleWidget = Container(
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(fontSize: 28),
          ),
        ));

    Widget descriptionWidget = Container(
        height: 40,
        margin: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ));

    Widget priceWidget = Container(
      width: 400,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
          margin: EdgeInsets.only(top: 10, right: 10),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Column(children: [
                Text(
                  "A partir de",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "R\$ $price",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                )
              ]))),
    );

    cardBody.add(Container(
        child: Column(
      children: [titleWidget, descriptionWidget, priceWidget],
    )));

    return cardBody;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardBody = getCardBody();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        width: 300,
        child: Column(
          children: cardBody,
        ),
      ),
    );
  }
}
