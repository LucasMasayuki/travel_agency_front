import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/backdrop/backdrop_controller.dart';
import 'package:travel_agency_front/app/components/horizontal_section/horizontal_section_widget.dart';

class CategoriesViewWidget extends StatefulWidget {
  const CategoriesViewWidget({Key key}) : super(key: key);

  @override
  _CategoriesViewWidgetState createState() => _CategoriesViewWidgetState();
}

class _CategoriesViewWidgetState extends State<CategoriesViewWidget> {
  final BackdropController backdropController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (backdropController.currentChosenTabIndex) {
        case 0:
          return HorizontalSectionWidget(
            items: [Text("ai")],
            title: "Testando",
          );
        case 1:
          return Text(
            "asdasdasdas",
            style: TextStyle(color: Colors.black),
          );
        case 2:
          return Text("2");
        case 3:
          return Text("3");
      }
    });
  }
}
