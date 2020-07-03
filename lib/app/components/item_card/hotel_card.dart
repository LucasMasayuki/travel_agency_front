import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';
import 'package:travel_agency_front/app/view_data/hotel_search_view_data.dart';
import 'package:travel_agency_front/app/view_data/hotel_view_data.dart';

class HotelCard extends StatelessWidget {
  final HotelViewData hotel;
  final HotelSearchViewData hotelSearchViewData;

  const HotelCard({
    Key key,
    @required this.hotel,
    @required this.hotelSearchViewData,
  }) : super(key: key);

  List<Widget> getCardBody(BuildContext context) {
    final bool isMobile = MediaHelper.isMobile(context);

    List<Widget> cardBody = [];

    Widget imgWidget = _getImageWidget();
    Widget titleWidget = _getTitleWidget(isMobile);
    Widget locationWidget = _getLocationWidget(isMobile);
    Widget starsWidget = _getStarsWidget(isMobile);
    Widget priceWidget = _getPriceWidget(isMobile);

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
      flex: 3,
    ));

    cardBody.add(Expanded(
      child: titleWidget,
      flex: 2,
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

  Widget _getPriceWidget(bool isMobile) {
    Widget priceWidget = Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      margin: EdgeInsets.only(right: 15, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              '${hotel.pricePerNight} por noite',
              style: TextStyle(
                fontSize: isMobile ? 10 : 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Text(
            hotel.total,
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
    return priceWidget;
  }

  Widget _getStarsWidget(bool isMobile) {
    Widget starsWidget = Container(
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          children: List.generate(
            hotel.stars,
            (index) => Container(
              child: Icon(
                Icons.star,
                size: isMobile ? 24 : 36,
                color: Colors.yellow[600],
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

  Widget _getLocationWidget(bool isMobile) {
    Widget locationWidget = Container(
      margin: EdgeInsets.only(left: 10),
      height: 30,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Locallização: ${hotel.neighborhoodCity}",
          style: TextStyle(
            fontSize: isMobile ? 12 : 16,
            color: Colors.black,
          ),
        ),
      ),
    );
    return locationWidget;
  }

  Widget _getTitleWidget(bool isMobile) {
    Widget titleWidget = Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          hotel.hotelName,
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
    List<Widget> cardBody = getCardBody(context);

    return GestureDetector(
      onTap: () => {
        Modular.to.pushNamed('/hotelDetails', arguments: {
          "hoteld": hotel.id,
          "checkIn": hotelSearchViewData.checkIn,
          "checkOut": hotelSearchViewData.checkOut
        })
      },
      child: Card(
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
      ),
    );
  }
}
