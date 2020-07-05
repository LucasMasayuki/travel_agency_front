import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/buttons/go_to_checkout_button.dart';
import 'package:travel_agency_front/app/models/car_model.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';
import 'package:travel_agency_front/app/view_data/car_rental_view_data.dart';

class CarRentalCard extends StatelessWidget {
  final CarRentalViewData carRental;
  const CarRentalCard({
    Key key,
    @required this.carRental,
  }) : super(key: key);

  List<Widget> getCardBody(BuildContext context) {
    final bool isMobile = MediaHelper.isMobile(context);
    List<Widget> cardBody = [];

    cardBody.add(Expanded(
      child: _getImageWidget(),
      flex: 4,
    ));

    cardBody.add(Expanded(
      child: _getTitleWidget(isMobile),
      flex: 2,
    ));

    cardBody.add(Expanded(
      child: _getCarInformationsWidget(isMobile),
      flex: 6,
    ));

    cardBody.add(Expanded(
      child: _getPriceAndWithdrawal(isMobile),
      flex: 2,
    ));

    cardBody.add(Expanded(
      child: _getTotalPriceWithButton(isMobile),
      flex: 1,
    ));

    return cardBody;
  }

  Widget _getTotalPriceWithButton(bool isMobile) {
    Widget button = GoToCheckoutButton(
      onPurchase: () => Modular.to.pushNamed('/checkout', arguments: carRental),
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
                    "Valor aluguel: ",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "R\$ ${carRental.total}",
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

  Widget _getPriceAndWithdrawal(bool isMobile) {
    Widget priceWidget = Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              "Informações sobre a retirada",
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
                    "Local: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    carRental.placeWithdrawn,
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

    return priceWidget;
  }

  Widget _getCarInformationsWidget(bool isMobile) {
    CarModel car = carRental.car;
    Widget descriptionWidget = Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              "Informações do carro",
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
                    "Modelo: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    car.model,
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
                    "Cassificação: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    car.classification,
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
                    "Quantidade de passageiros: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    car.quantityPassengers.toString(),
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
                    "Quantidade de portas: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    car.doorsQuantity.toString(),
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
                    "Tipo cambio: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    car.changeType,
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
                    "Ar condicionado: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    car.airConditioning ? "Sim" : "Não",
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
          carRental.title,
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
      height: double.infinity,
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

    if (carRental.car.photo != null) {
      imgContainer = Container(
        width: double.infinity,
        height: double.infinity,
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          imageUrl: carRental.car.photo,
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
