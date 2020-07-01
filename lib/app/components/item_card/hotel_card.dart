import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/view_data/hotel_view_data.dart';

class HotelCard extends StatelessWidget {
  final HotelViewData hotel;
  const HotelCard({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  List<Widget> getCardBody() {
    List<Widget> cardBody = [];

    Widget imgWidget = _getImageWidget();
    Widget titleWidget = _getTitleWidget();
    Widget locationWidget = _getLocationWidget();
    Widget starsWidget = _getStarsWidget();
    Widget priceWidget = _getPriceWidget();

    cardBody.add(Expanded(
      child: Stack(
        children: [
          imgWidget,
          Positioned(
            bottom: 0,
            right: 0,
            child: starsWidget,
          )
        ],
      ),
      flex: 2,
    ));

    cardBody.add(Expanded(
      child: titleWidget,
      flex: 1,
    ));

    cardBody.add(Expanded(
      child: locationWidget,
      flex: 1,
    ));

    cardBody.add(Expanded(
      child: priceWidget,
      flex: 1,
    ));

    return cardBody;
  }

  Widget _getPriceWidget() {
    Widget priceWidget = Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              '${hotel.pricePerNight} por noite',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Text(
            hotel.total,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
    return priceWidget;
  }

  Widget _getStarsWidget() {
    Widget starsWidget = Container(
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          children: List.generate(
            hotel.stars,
            (index) => Container(
              child: Icon(
                Icons.star,
                size: 24,
                color: Colors.yellowAccent,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
        ),
      ),
    );
    return starsWidget;
  }

  Widget _getLocationWidget() {
    Widget locationWidget = Container(
      margin: EdgeInsets.only(left: 10),
      height: 30,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Locallização: ${hotel.neighborhoodCity}",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
    return locationWidget;
  }

  Widget _getTitleWidget() {
    Widget titleWidget = Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          hotel.hotelName,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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

    if (hotel.photo != null) {
      imgContainer = Container(
        width: double.infinity,
        height: double.infinity,
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          imageUrl: hotel.photo,
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
    List<Widget> cardBody = getCardBody();
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
