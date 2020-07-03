import 'package:flutter/material.dart';

class HotelDetailsPage extends StatefulWidget {
  final int hotelId;
  final String checkIn;
  final String checkOut;

  const HotelDetailsPage(
      {Key key,
      @required this.hotelId,
      @required this.checkIn,
      @required this.checkOut})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HotelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
