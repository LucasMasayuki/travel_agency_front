import 'package:flutter/material.dart';

class GoToCheckoutButton extends StatelessWidget {
  final Function onPurchase;

  const GoToCheckoutButton({
    Key key,
    this.onPurchase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: this.onPurchase,
      child: Text('Selecionar'),
      color: Colors.orange[400],
      textColor: Colors.white,
    );
  }
}
