import 'package:flutter/material.dart';

class MySnackbar extends StatelessWidget {
  const MySnackbar({super.key, required this.label, required this.content});

  final String label;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SnackBar(
        action: SnackBarAction(
          label: label,
          onPressed: () {
            // Code to execute.
          },
        ),
        content: content,
        duration: const Duration(milliseconds: 1500),
        width: 280.0,
        // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
