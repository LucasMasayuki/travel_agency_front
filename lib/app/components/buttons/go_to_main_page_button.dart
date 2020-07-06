import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GoToMainPageButton extends StatelessWidget {
  const GoToMainPageButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () => Modular.to.popUntil(ModalRoute.withName("/")),
      child: Text('Voltar para página inicial'),
      color: Colors.indigo,
      textColor: Colors.white,
    );
  }
}
