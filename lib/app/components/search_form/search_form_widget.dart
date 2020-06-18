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
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: RaisedButton(
        onPressed: () {},
        child: Text('Save'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.formBody.add(getSearchButton());

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.formBody,
      ),
    );
  }
}
