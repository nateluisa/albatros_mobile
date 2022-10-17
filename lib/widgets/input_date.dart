// import 'dart:async';
// import 'package:flutter/material.dart';
//
//
// class InputDatePicker extends StatefulWidget {
//   @override
//   _InputDatePickerState createState() => _InputDatePickerState();
// }
//
//
//
// class _InputDatePickerState extends State<InputDatePicker> {
//   DateTime currentDate = DateTime.now();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//         context: context,
//         locale: const Locale("pt", "PT"),
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2100),
//         builder: (BuildContext context, Widget? child) {
//           return Theme(
//             data: ThemeData.dark(),
//             child: child!,
//           );
//         });
//     if (pickedDate != null && pickedDate != currentDate) {
//       setState(() {
//         currentDate = pickedDate;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(7.0),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(
//                   label: Text('')
//               ),
//               onTap: () => _selectDate(context),
//               keyboardType: TextInputType.none,
//               initialValue: (currentDate.toString()),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }