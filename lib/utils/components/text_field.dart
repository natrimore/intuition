import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter>? formatter;
  final TextInputType? inputType;
  final String? prefixText;
  final bool isFocused;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hintText,
      this.obscureText = false,
      this.formatter,
      this.inputType,
      this.prefixText = "",
      this.isFocused = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: inputType,
          autofocus: isFocused,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
          decoration: InputDecoration(
              hintText: hintText,
              prefixText: prefixText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
          obscureText: obscureText,
          controller: controller,
          inputFormatters: formatter,
        ),
      ],
    );
  }
}
