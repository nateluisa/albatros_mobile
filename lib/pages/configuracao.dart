import 'package:flutter/material.dart';

import '../initial_pages/home.dart';
import '../widgets/checkbox.dart';

const List<String> list = <String>['Sensor', 'Vertical', 'Horizontal'];

class Configuracao extends StatefulWidget {
  const Configuracao({Key? key}) : super(key: key);

  @override
  State<Configuracao> createState() => _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Color.fromARGB(255, 76, 36, 48),
          ],
        )),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Informe o usuário!';
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text('Usuário do sistema')),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Informe a senha!';
                      }
                    },
                    decoration: const InputDecoration(label: Text('Senha')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 208.0),
                    child: SizedBox(
                      width: 200,
                      height: 60,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        elevation: 16,
                        style: const TextStyle(color: Color.fromARGB(255, 106, 16, 48), fontSize: 18),
                        underline: Container(
                          height: 2,
                          color: const Color.fromARGB(255, 106, 16, 48),
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(label: Text('Tipo de desconto')),
                  ),
                  const MyCheckbox(
                    activeColor: Color.fromARGB(255, 106, 16, 48),
                    title: Text('Exibir dados da empresa para impressão'),
                  ),
                  const MyCheckbox(
                    activeColor: Color.fromARGB(255, 106, 16, 48),
                    title: Text('Limpar clientes'),
                  ),
                  const MyCheckbox(
                    activeColor: Color.fromARGB(255, 106, 16, 48),
                    title: Text('Limpar produtos'),
                  ),
                  const MyCheckbox(
                    activeColor: Color.fromARGB(255, 106, 16, 48),
                    title: Text('Limpar tabelas de preço'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(
                homeContext: context,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Configuração salva!'),
          ));
          // saveClient(widget.name, widget.adress, widget.number,
          //     widget.district, widget.telephone);
        },
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
        child: const Icon(Icons.save),
      ),
    );
  }
}
