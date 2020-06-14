import 'package:flutter/material.dart';

class HorizontalSectionWidget extends StatelessWidget {
  final items;
  final String title;
  const HorizontalSectionWidget(
      {Key key, @required this.items, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 350.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: items,
        ));
  }
}
