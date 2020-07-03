import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/cart/cart_view_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CartViewModel cartViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
