import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/components/item_card/hotel_details_card.dart';

class HotelDetailsPage extends StatefulWidget {
  final int hotelId;
  final String checkIn;
  final String checkOut;
  final String name;

  const HotelDetailsPage({
    Key key,
    @required this.hotelId,
    @required this.checkIn,
    @required this.checkOut,
    @required this.name,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HotelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      title: Text(widget.name),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: HotelDetailCard(),
      ),
    );
  }
}
