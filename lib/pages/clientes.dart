import 'package:flutter/material.dart';

class Clientes extends StatelessWidget {
  const Clientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center
          (child: Text('CLIENTES')),
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 200,
            width: 200,
            child: Text('Teste de pagina'),
          )
        ],
      ),
    );
  }
}
