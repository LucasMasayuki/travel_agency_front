import 'package:flutter/material.dart';

class SearchFormWidget extends StatefulWidget {
  final List<Widget> formBody;
  final Function onSearch;

  const SearchFormWidget(
      {Key key, @required this.formBody, @required this.onSearch})
      : super(key: key);

  @override
  _SearchFormWidgetState createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  Widget getSearchButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: widget.onSearch,
        child: Text('Procurar'),
        color: Colors.orange[400],
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.formBody.add(getSearchButton());

    return Form(
      child: ListView(
        children: widget.formBody,
      ),
    );
  }
}
