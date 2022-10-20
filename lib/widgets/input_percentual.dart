import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class MyInputPercentual extends StatelessWidget {
  const MyInputPercentual({Key? key, this.label}) : super(key: key);
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          // input percentual
          inputFormatters: [
            CurrencyTextInputFormatter(
                locale: 'pt-br',
                symbol: '%',
                decimalDigits: 2,
                turnOffGrouping: true)
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            label: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
