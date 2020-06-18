import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String categoryName;
  final String title;
  final String description;
  final String photo;
  final String price;
  const ItemCardWidget({
    Key key,
    this.photo,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.categoryName,
  }) : super(key: key);

  List<Widget> getCardBody() {
    List<Widget> cardBody = [];
    Widget placeholderImg = Container(
      width: 300,
      height: 140,
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

    if (photo != null) {
      imgContainer = Container(
        width: 300,
        height: 140,
        child: CachedNetworkImage(
          imageUrl: photo,
          placeholder: (context, url) => Center(
            child: Container(
              color: Colors.white,
            ),
          ),
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

    Widget categoryNameWidget = Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          categoryName,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );

    Widget titleWidget = Container(
      margin: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );

    Widget descriptionWidget = Container(
      height: 140,
      margin: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );

    Widget priceWidget = Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      height: 40,
      margin: EdgeInsets.only(left: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A partir de",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "R\$ $price",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );

    cardBody.add(Expanded(
      child: imgContainer,
      flex: 4,
    ));

    cardBody.add(Expanded(
      child: categoryNameWidget,
      flex: 1,
    ));

    cardBody.add(Expanded(
      child: titleWidget,
      flex: 3,
    ));

    cardBody.add(Expanded(
      child: descriptionWidget,
      flex: 4,
    ));

    cardBody.add(Expanded(
      child: priceWidget,
      flex: 2,
    ));

    return cardBody;
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
        width: 250,
        child: Column(
          children: cardBody,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
