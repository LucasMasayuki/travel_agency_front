import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/item_card/view_models/hotel_details_view_model.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';

class HotelDetailCard extends StatefulWidget {
  const HotelDetailCard({Key key}) : super(key: key);

  @override
  _HotelDetailCardState createState() => _HotelDetailCardState();
}

class _HotelDetailCardState extends State<HotelDetailCard> {
  HotelDetailsViewModel hotelDetailsViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (hotelDetailsViewModel.isLoading) {
          return LoadingPageWidget();
        }

        if (hotelDetailsViewModel.isEmptyPage) {
          return EmptyPageWidget();
        }

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 2,
          child: Container(
            child: Container(),
          ),
        );
      },
    );
  }
}
