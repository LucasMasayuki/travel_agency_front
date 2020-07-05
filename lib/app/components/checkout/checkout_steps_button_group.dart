import 'package:flutter/material.dart';

class CheckoutStepsButtonGroup extends StatelessWidget {
  final Function onClickNext;
  final Function onClickPrev;
  final String prevButtonText;
  final String nextButtonText;
  final bool showPrevButton;

  const CheckoutStepsButtonGroup({
    Key key,
    @required this.onClickNext,
    @required this.onClickPrev,
    @required this.prevButtonText,
    @required this.nextButtonText,
    @required this.showPrevButton,
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
      child: ButtonBarTheme(
        data: ButtonBarThemeData(mainAxisSize: MainAxisSize.max),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: buttons,
        ),
      ),
    );
  }

  Widget _getPrevButton() {
    Widget prevButton = Expanded(
      child: Align(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: this.onClickPrev,
          child: Text(this.prevButtonText),
          color: Colors.black12,
          textColor: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
    );

    return prevButton;
  }

  Widget _getNextButton() {
    Widget nextButton = Expanded(
      child: Align(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: this.onClickNext,
          child: Text(this.nextButtonText),
          color: Colors.green[400],
          textColor: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
    );

    return nextButton;
  }
}
