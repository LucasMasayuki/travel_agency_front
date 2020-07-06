import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/buttons/go_to_checkout_button.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';
import 'package:travel_agency_front/app/view_data/room_view_data.dart';

class RoomsCard extends StatelessWidget {
  final RoomViewData room;

  const RoomsCard({
    Key key,
    @required this.room,
  }) : super(key: key);

  List<Widget> getCardBody(BuildContext context) {
    final bool isMobile = MediaHelper.isMobile(context);

    List<Widget> cardBody = [];

    cardBody.add(Expanded(
      child: _getImageWidget(),
      flex: 3,
    ));

    cardBody.add(Expanded(
      child: _getTitleWidget(isMobile),
      flex: 1,
    ));

    cardBody.add(Expanded(
      child: _getDescriptionWidget(isMobile),
      flex: 3,
    ));

    cardBody.add(Expanded(
      child: _getTotalPriceWithButton(isMobile),
      flex: 2,
    ));

    return cardBody;
  }

  Widget _getTotalPriceWithButton(bool isMobile) {
    Widget button = GoToCheckoutButton(
      onPurchase: () => Modular.to.pushNamed('/checkout', arguments: room),
    );

    Widget totalPriceWithButtonWidget = Container(
      height: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    "Valor total: ",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "R\$ ${room.totalPrice}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: button,
            flex: 4,
          ),
        ],
      ),
    );

    return totalPriceWithButtonWidget;
  }

  Widget _getDescriptionWidget(bool isMobile) {
    Widget descriptionWidget = Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              "Informações do quarto",
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
                    "Opções cama: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    room.bedOptions,
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
                    "Acomodação: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    room.totalPeopleMessage,
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
                    "Preço por noite: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "R\$ ${room.pricePerNight}",
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

  Widget _getTitleWidget(bool isMobile) {
    Widget titleWidget = Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          room.name,
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return titleWidget;
  }

  Widget _getImageWidget() {
    Widget placeholderImg = Container(
      width: double.infinity,
      height: 90,
      child: Align(
        alignment: Alignment.center,
        child: Icon(Icons.image),
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );

    Widget imgContainer = placeholderImg;

    if (room.originalPhoto != null) {
      imgContainer = Container(
        width: double.infinity,
        height: double.infinity,
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          imageUrl: room.originalPhoto,
          placeholder: (context, url) => Center(
            child: Container(
              color: Colors.white,
            ),
          ),
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => placeholderImg,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      );
    }

    return imgContainer;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardBody = getCardBody(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 2,
      child: Container(
        child: Column(
          children: cardBody,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
