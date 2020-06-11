import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/components/backdrop/backdrop_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BackdropWidget(
      tabIcons: [
        Tab(icon: Icon(Icons.airplanemode_active)),
        Tab(icon: Icon(Icons.directions_transit)),
      ],
      backLayer: Container(
        color: Colors.red,
      ),
      frontLayer: Center(),
      backTitle: Text("Filtrar"),
      frontTitle: Text("Travel Agency"),
    );
  }
}
