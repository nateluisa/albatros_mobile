import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, required this.label, required this.onPressed, required this.icon}) : super(key: key);
  final Widget label;
  final VoidCallback onPressed;
  final Widget icon;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black54, backgroundColor: const Color.fromARGB(255, 106, 16, 48),
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: label,
      icon: icon,
      style: raisedButtonStyle,
      onPressed: onPressed,

    );
  }
}
