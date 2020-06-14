import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/components/backdrop/backdrop_widget.dart';
import 'package:travel_agency_front/app/components/categories_view/categories_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BackdropWidget(
      tabIcons: [
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("APPS"),
          ),
        ),
        Tab(icon: Icon(Icons.airplanemode_active)),
        Tab(icon: Icon(Icons.directions_transit)),
      ],
      backLayer: Container(
        color: Colors.indigo,
      ),
      frontLayer: CategoriesViewWidget(),
      backTitle: Text("Filtrar"),
      frontTitle: Text("Travel Agency"),
    );
  }
}
