import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/backdrop/backdrop_controller.dart';
import 'package:travel_agency_front/app/components/horizontal_section/horizontal_section_widget.dart';
import 'package:travel_agency_front/app/components/item_card/item_card_widget.dart';

class CategoriesViewWidget extends StatefulWidget {
  const CategoriesViewWidget({Key key}) : super(key: key);

  @override
  _CategoriesViewWidgetState createState() => _CategoriesViewWidgetState();
}

class _CategoriesViewWidgetState extends State<CategoriesViewWidget> {
  final BackdropController backdropController = Modular.get();
  @override
  Widget build(BuildContext context) {
    var items;
    return Observer(builder: (_) {
      switch (backdropController.currentChosenTabIndex) {
        case 0:
          items = HorizontalSectionWidget(
            items: [
              ItemCardWidget(
                  categoryName: "Hospedagens",
                  title: "Hotel 5 estrelas",
                  description: "Colors.red",
                  photo:
                      "https://www.interativapantanal.com.br/_images/especiais/208672197.jpg",
                  price: "142,00"),
              ItemCardWidget(
                  categoryName: "Hospedagens",
                  title: "Fazenda especial",
                  description: "Colors.red",
                  price: "122,00"),
              ItemCardWidget(
                  categoryName: "Hospedagens",
                  title: "Hotel fazenda especial",
                  description: "Colors.red",
                  price: "55,00")
            ],
            title: "Testando",
          );
          break;
        case 1:
          items = Text(
            "asdasdasdas",
            style: TextStyle(color: Colors.black),
          );
          break;
        case 2:
          items = Text("2");
          break;
        case 3:
          items = Text("3");
          break;
      }

      return ListView(
        scrollDirection: Axis.vertical,
        children: [items, items, items],
      );
    });
  }
}
