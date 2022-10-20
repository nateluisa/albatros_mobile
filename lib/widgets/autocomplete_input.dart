import 'package:flutter/material.dart';

class InputAutocomplete extends StatelessWidget {
  const InputAutocomplete(
      {Key? key, required this.label, required this.suggestons})
      : super(key: key);
  final Widget label;
  final List<String> suggestons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Autocomplete(
        fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          return SizedBox(
            height: 52,
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  label: label,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              focusNode: focusNode,
            ),
          );
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          } else {
            List<String> matches = <String>[];
            matches.addAll(suggestons);

            matches.retainWhere((s) {
              return s
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
            return matches;
          }
        },
      ),
    );
  }
}
