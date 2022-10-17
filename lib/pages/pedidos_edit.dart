import 'package:albatros_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';

class PedidosEditScreen extends StatelessWidget {
  const PedidosEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyDrawer(
      child: Padding(
        padding: EdgeInsets.only(top: 27, left: 28, right: 8, bottom: 0),
        child: Text(
          'Teste de titulo de drawer',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
