import 'package:flutter/material.dart';

enum Menu { Exemplo1, Exemplo2, Exemplo3, Exemplo4 }


class MyPopup extends StatefulWidget {
  const MyPopup({super.key});

  @override
  State<MyPopup> createState() => _MyPopupState();
}

class _MyPopupState extends State<MyPopup> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PopupMenuButton<Menu>(
          // Callback that sets the selected popup menu item.
            onSelected: (Menu item) {
              setState(() {
                _selectedMenu = item.name;
              });
            },
            position: PopupMenuPosition.over,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.Exemplo1,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.Exemplo2,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.Exemplo3,
                child: Text('Item 3'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.Exemplo4,
                child: Text('Item 4'),
              ),
            ]),
        TextFormField(
          initialValue: ('Selecionou: $_selectedMenu'),
        ),
      ],
    );
  }
}
