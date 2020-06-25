import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/components/backdrop/backdrop_widget.dart';
import 'package:travel_agency_front/app/components/categories_view/categories_view_widget.dart';
import 'package:travel_agency_front/app/components/search_items/search_items_widget.dart';

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
            child: Column(children: [Icon(Icons.hotel), Text("Hospedagem")]),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Column(children: [Icon(Icons.flight_takeoff), Text("Voos")]),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Column(children: [Icon(Icons.local_offer), Text("Pacotes")]),
          ),
        ),
      ],
      backLayer: SearchItemsViewWidget(),
      frontLayer: CategoriesViewWidget(),
      backTitle: Text("Filtrar"),
      frontTitle: Text("Travel Agency"),
    );
  }
}
