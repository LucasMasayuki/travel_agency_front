import 'package:flutter/material.dart';

class CheckoutDonePage extends StatefulWidget {
  const CheckoutDonePage({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutDonePageState createState() => _CheckoutDonePageState();
}

class _CheckoutDonePageState extends State<CheckoutDonePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Icon(Icons.check),
                Text("Compra concluida com sucesso"),
                Text("Muito obrigado pela sua preferência"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
