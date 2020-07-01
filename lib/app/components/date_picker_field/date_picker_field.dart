import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';

class DatePickerField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final TextEditingController controller;

  const DatePickerField({
    Key key,
    @required this.onChanged,
    @required this.hintText,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    return TextFormFieldCustom(
      hintText: 'check out',
      onChanged: onChanged,
      prefixIcon: Icon(Icons.calendar_today),
      inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
      onTap: () {
        var now = DateTime.now();
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(now.year, now.month, now.day),
          maxTime: DateTime(now.year + 30, now.month, now.day),
          onConfirm: (date) {
            DateFormat formatter = new DateFormat('dd/MM/yyyy');
            var _date = date;
            controller.text = formatter.format(date);
            onChanged(_date);
          },
          currentTime: currentTime,
          locale: LocaleType.pt,
        );
      },
    );
  }
}
