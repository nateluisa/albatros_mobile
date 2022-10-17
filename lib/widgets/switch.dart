import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({super.key, this.title});

  final Widget? title;

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Color.fromARGB(255, 106, 16, 48),
      title: widget.title,
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
    );
  }
}
