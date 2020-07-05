import 'package:flutter/material.dart';

class DialogConfirmButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String text;

  const DialogConfirmButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: this.onPressed,
      child: Text(this.text),
      color: this.color,
      textColor: Colors.white,
    );
  }
}
