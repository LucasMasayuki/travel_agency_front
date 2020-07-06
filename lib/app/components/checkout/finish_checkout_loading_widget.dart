import 'package:flutter/material.dart';

class FinishCheckoutLoadingWidget extends StatelessWidget {
  const FinishCheckoutLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 34, 16, 0),
      child: Center(
        child: Column(children: [
          Expanded(
            child: Container(
              width: 60,
              height: 60,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Text(
              "Finalizando pedido, aguarde só um instante ...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            flex: 3,
          )
        ]),
      ),
    );
  }
}
