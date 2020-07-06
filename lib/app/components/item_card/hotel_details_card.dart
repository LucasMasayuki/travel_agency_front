import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/components/item_card/rooms_card.dart';
import 'package:travel_agency_front/app/components/item_card/view_models/hotel_details_view_model.dart';
import 'package:travel_agency_front/app/components/loading_page/loading_page_widget.dart';
import 'package:travel_agency_front/app/models/room_model.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';
import 'package:travel_agency_front/app/view_data/hotel_details_view_data.dart';
import 'package:travel_agency_front/app/view_data/room_view_data.dart';

class HotelDetailCard extends StatefulWidget {
  const HotelDetailCard({Key key}) : super(key: key);

  @override
  _HotelDetailCardState createState() => _HotelDetailCardState();
}

class _HotelDetailCardState extends State<HotelDetailCard> {
  HotelDetailsViewModel hotelDetailsViewModel = Modular.get();
  bool isMobile = false;

  Widget _getDescriptionWidget() {
    HotelDetailsViewData hotel = hotelDetailsViewModel.hotelDetailsViewData;
    Widget descriptionWidget = Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              "Sobre o hotel",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    "Estrelas: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    hotel.stars,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    "Endereço completo: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    hotel.address,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    "Horario check in: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    hotel.completeCheckIn,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    "Horario check out: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    hotel.completeCheckOut,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return descriptionWidget;
  }

  Widget _getTitleWidget() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          hotelDetailsViewModel.hotelDetailsViewData.name,
          style: TextStyle(
            fontSize: isMobile ? 16 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<Widget> _getMainCardBody() {
    List<Widget> cardBody = [];

    cardBody.add(Expanded(
      child: _getTitleWidget(),
      flex: 1,
    ));

    cardBody.add(Expanded(
      child: _getDescriptionWidget(),
      flex: 3,
    ));

    return cardBody;
  }

  Widget mainCard() {
    List<Widget> cardBody = _getMainCardBody();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 250,
        height: double.infinity,
        child: Column(
          children: cardBody,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      isMobile = MediaHelper.isMobile(context);
      if (hotelDetailsViewModel.isLoading) {
        return LoadingPageWidget();
      }

      if (hotelDetailsViewModel.isEmptyPage) {
        return EmptyPageWidget();
      }

      double ratio = MediaHelper.getChildAspectRatio(context);
      List<Widget> cards = [
        mainCard(),
      ];

      hotelDetailsViewModel.hotelDetailsViewData.rooms.forEach((
        RoomModel element,
      ) {
        RoomViewData roomViewData = RoomViewData(roomModel: element);
        cards.add(RoomsCard(room: roomViewData));
      });

      return GridView.count(
        padding: EdgeInsets.all(10),
        childAspectRatio: ratio * 1.5,
        shrinkWrap: true,
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: cards,
      );
    });
  }
}
