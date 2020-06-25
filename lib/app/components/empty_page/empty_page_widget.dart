import 'package:flutter/material.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 34, 16, 0),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24),
            Container(
              width: 250,
              child: Text(
                "Nenhum item encontrado",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
