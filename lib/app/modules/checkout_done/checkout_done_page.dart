import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/components/buttons/go_to_main_page_button.dart';

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Text(
                    "Compra concluida com sucesso",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Muito obrigado pela sua preferência",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  GoToMainPageButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
