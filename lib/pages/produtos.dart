import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {
  const Produtos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center
          (child: Text('PRODUTOS')),
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
