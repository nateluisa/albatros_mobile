// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:flutter/material.dart';
//
// class MyAutocomplete extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MyAutocompleteState();
// }
//
// class _MyAutocompleteState extends State<MyAutocomplete> {
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 106, 16, 48),
//         body: FirstPage());
//   }
// }
//
// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }
//
// class _FirstPageState extends State<FirstPage> {
//   List<String> added = [];
//   String currentText = "";
//   GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
//
//   _FirstPageState() {
//     textField = SimpleAutoCompleteTextField(
//       key: key,
//       controller: TextEditingController(),
//       suggestions: suggestions,
//       textChanged: (text) => currentText = text,
//       clearOnSubmit: true,
//       // textSubmitted: (text) => setState(() {
//       //   if (text != "") {
//       //     added.add(text);
//       //   }
//       // }),
//     );
//   }
//
//   List<String> suggestions = [
//     "Teste1",
//     "Teste2",
//     "Teste3",
//     "Teste4",
//     "Teste5",
//     "Teste6",
//     "Teste7",
//     "Teste8",
//     "Teste9",
//     "Teste10",
//     "Teste11",
//     "Teste12",
//     "Teste13",
//     "Teste14",
//     "Teste15",
//     "Teste16",
//     "Teste17",
//     "Teste18",
//     "Teste19",
//     "Teste20",
//     "Teste21",
//     "Teste22",
//     "Teste23",
//     "Teste24",
//     "Teste25",
//     "Teste26",
//     "Teste27",
//     "Teste28",
//   ];
//
//   SimpleAutoCompleteTextField? textField;
//   bool showWhichErrorText = false;
//
//   @override
//   Widget build(BuildContext context) {
//     Column body = Column(children: [
//       ListTile(
//         title: textField,
//       ),
//     ]);
//
//     body.children.addAll(added.map((item) {
//       return ListTile(title: Text(item));
//     }));
//
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 106, 16, 48),
//           title: const Text('Buscar'),
//           actions: const []),
//       body: body,
//     );
//   }
// }
