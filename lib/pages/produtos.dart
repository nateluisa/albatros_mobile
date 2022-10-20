import 'package:albatros_mobile/widgets/autocomplete.dart';
import 'package:albatros_mobile/widgets/autocomplete_input.dart';
import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {
  const Produtos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputAutocomplete(label: Text('Teste de autocomplete'), suggestons: ['teste']);
  }
}
