import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';

class DatePickerField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final Function validator;
  final String initialValue;
  final double fontSize;
  final contentPadding;
  final TextEditingController controller;
  final String onChangeFormatter;

  const DatePickerField({
    Key key,
    @required this.onChanged,
    @required this.hintText,
    @required this.controller,
    @required this.onChangeFormatter,
    this.validator,
    this.initialValue,
    this.fontSize,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    return TextFormFieldCustom(
      controller: this.controller,
      initialValue: this.initialValue,
      validator: this.validator,
      hintText: this.hintText,
      contentPadding: this.contentPadding,
      fontSize: this.fontSize,
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
            var _date = date;
            DateFormat formatter = new DateFormat('dd/MM/yyyy');
            String dateString = formatter.format(date);
            this.controller.text = dateString;
            formatter = new DateFormat(onChangeFormatter);
            dateString = formatter.format(_date);
            this.onChanged(dateString);
          },
          currentTime: currentTime,
          locale: LocaleType.pt,
        );
      },
    );
  }
}
