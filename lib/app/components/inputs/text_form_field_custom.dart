import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String errorText;
  final String hintText;
  final Function onChanged;
  final Function onTap;
  final Function validator;
  final TextInputType keyboardType;
  final int maxLength;
  final controller;
  final textCapitalization;
  final inputFormatters;
  final contentPadding;
  final double fontSize;
  final initialValue;
  final bool obscureText;
  final Icon prefixIcon;

  const TextFormFieldCustom({
    Key key,
    this.errorText,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.textCapitalization,
    this.contentPadding,
    this.prefixIcon,
    this.onTap,
    this.fontSize,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(32.0),
          ),
        ),
        contentPadding: this.contentPadding,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
      ),
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Poppins",
        fontSize: this.fontSize,
      ),
      validator: this.validator,
      controller: controller,
      obscureText: obscureText,
      inputFormatters: this.inputFormatters,
      onTap: this.onTap,
      onChanged: this.onChanged,
    );
  }
}
