import 'package:flutter/material.dart';

class LoadingPageWidget extends StatelessWidget {
  const LoadingPageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 34, 16, 0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
