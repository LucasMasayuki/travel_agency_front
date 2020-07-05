import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/components/checkout/checkout_steps_widget.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class CheckoutPage extends StatefulWidget {
  final RowViewDataAbstract item;
  const CheckoutPage({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      title: Text("Finalizar pedido"),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: CheckoutStepsWidget(item: this.widget.item),
      ),
    );
  }
}
