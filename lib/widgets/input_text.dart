import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInputText extends StatelessWidget {
  const MyInputText(
      {Key? key,
      this.controller,
      this.inputFormatters,
      required this.keyboardType,
      this.maxLength,
      this.label,
      this.validator,
      this.icon})
      : super(key: key);

  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final int? maxLength;
  final Widget? label;
  final FormFieldValidator<String>? validator;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
          validator: validator,
          controller: controller,
          inputFormatters: [],
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            label: label,
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
          )),
    );
  }
}
