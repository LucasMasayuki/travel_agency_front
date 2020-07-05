import 'package:flutter/material.dart';

class CheckoutStepsButtonGroup extends StatelessWidget {
  final Function onClickNext;
  final Function onClickPrev;
  final String prevButtonText;
  final String nextButtonText;
  final bool showPrevButton;
  final double minWidth;

  const CheckoutStepsButtonGroup({
    Key key,
    @required this.onClickNext,
    @required this.onClickPrev,
    @required this.prevButtonText,
    @required this.nextButtonText,
    @required this.showPrevButton,
    this.minWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [
      _getPrevButton(),
      _getNextButton(),
    ];

    if (!this.showPrevButton) {
      buttons = [Container(), _getNextButton()];
    }
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ButtonBarTheme(
        data: ButtonBarThemeData(
          mainAxisSize: MainAxisSize.max,
          buttonMinWidth: this.minWidth,
        ),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: buttons,
        ),
      ),
    );
  }

  Widget _getPrevButton() {
    Widget prevButton = RaisedButton(
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: this.onClickPrev,
      child: Text(this.prevButtonText),
      color: Colors.grey,
      textColor: Colors.white,
    );

    return prevButton;
  }

  Widget _getNextButton() {
    Widget nextButton = RaisedButton(
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: this.onClickNext,
      child: Text(this.nextButtonText),
      color: Colors.greenAccent[400],
      textColor: Colors.white,
    );

    return nextButton;
  }
}
