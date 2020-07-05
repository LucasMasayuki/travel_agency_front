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
          Expanded(child: CircularProgressIndicator()),
          Expanded(
              child: Text(
            "Finalizando pedido, aguarde só um instante ...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ))
        ]),
      ),
    );
  }
}
