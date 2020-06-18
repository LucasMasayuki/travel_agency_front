import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/backdrop/backdrop_controller.dart';
import 'package:travel_agency_front/app/components/search_form/search_form_widget.dart';

class SearchItemsViewWidget extends StatefulWidget {
  const SearchItemsViewWidget({Key key}) : super(key: key);

  @override
  _SearchItemsViewWidgetState createState() => _SearchItemsViewWidgetState();
}

class _SearchItemsViewWidgetState extends State<SearchItemsViewWidget> {
  final BackdropController backdropController = Modular.get();

  @override
  Widget build(BuildContext context) {
    List<Widget> inputs;
    return Observer(
      builder: (_) {
        switch (backdropController.currentChosenTabIndex) {
          case 0:
            inputs = [];
            break;
          case 1:
            inputs = [
              Text(
                "asdasdasdas",
                style: TextStyle(color: Colors.black),
              )
            ];
            break;
          case 2:
            inputs = [Text("2")];
            break;
          case 3:
            inputs = [Text("3")];
            break;
        }

        return Container(
          child: Card(
            color: Colors.purpleAccent,
            child: SearchFormWidget(
              formBody: inputs,
              onSearch: null,
            ),
          ),
        );
      },
    );
  }
}
