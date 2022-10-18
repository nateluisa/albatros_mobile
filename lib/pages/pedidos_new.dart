import 'package:albatros_mobile/dao/pedidos_dao.dart';
import 'package:albatros_mobile/pages/pedidos.dart';
import 'package:albatros_mobile/widgets/custom_dropdown.dart';
import 'package:albatros_mobile/widgets/date_picker.dart';
import 'package:albatros_mobile/widgets/dialog.dart';
import 'package:albatros_mobile/widgets/dropdownmenu.dart';
import 'package:flutter/material.dart';

import '../model/pedidos.dart';

class PedidosNewScreen extends StatefulWidget {
  final cliente;
  final endereco;
  final numero;
  final bairro;
  final telefone;

  const PedidosNewScreen(
      {Key? key,
      this.cliente,
      this.endereco,
      this.numero,
      this.bairro,
      this.telefone,
      required BuildContext clientsNewContext})
      : super(key: key);

  @override
  State<PedidosNewScreen> createState() => _PedidosNewScreenState();
}

class _PedidosNewScreenState extends State<PedidosNewScreen> {
  final TextEditingController _clienteController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  final PedidosDao _dao = PedidosDao();

  // late Bank bank;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];

    String? selectedValue;

    return Form(
      key: _formKey,
      child: Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 106, 16, 48),
                title: const Text('Novo pedido'),
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.account_box_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                    ),
                    Tab(
                      icon: Icon(Icons.add),
                    ),
                    Tab(
                      icon: Icon(Icons.add_a_photo_rounded),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.only(bottom: 85),
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _clienteController,
                                      validator: (String? value) {
                                        if (value != null && value.isEmpty) {
                                          return 'Informe o nome';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Nome',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _numeroController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Informe o numero';
                                      }
                                    },
                                    decoration:
                                        (InputDecoration(hintText: 'Numero')),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _enderecoController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o endereço';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Endereço')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _bairroController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o bairro';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Bairro')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _telefoneController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o telefone';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Telefone')),
                              ),
                            ),
                            const MyDatePicker(
                                dateLabelText: 'Data do pedido',
                                readOnly: false),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: AlignmentDirectional.bottomStart,
                              child: MyCustomDrop(
                                dropdownItems: items,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                hint: Text('Item1'),
                              ),
                            ),
                            Container
                              (alignment: AlignmentDirectional.topStart,
                                child: const MyDropDownMenu()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return MyAlertDialog(
                                              onConfirm: () {
                                                Navigator.pop(context);
                                              },
                                              onCancel: () {
                                                Navigator.pop(context);
                                              },
                                              content: Text(
                                                  'Teste de subtitulo ou conteudo de dialog'),
                                              title: Text(
                                                  'Teste de title de dialogo'),
                                              icon: const Icon(
                                                Icons.warning_rounded,
                                                size: 45,
                                                color: Colors.yellow,
                                              ));
                                        });
                                  },
                                  child: const Text('Dialog')),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Teste de input',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Teste de input2',
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Teste de input3'),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Teste de input4',
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Teste de input 5'),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                elevation: 2.0,
                onPressed: () {
                  print('salvou');
                  final String name = _clienteController.text;
                  final String adress = _enderecoController.text;
                  final int number = int.parse(_numeroController.text);
                  final String district = _bairroController.text;
                  final int telephone = int.parse(_telefoneController.text);
                  final Pedido newPedido =
                      Pedido(0, name, adress, number, district, telephone);
                  _dao.savePedido(newPedido).then((id) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Pedidos(),
                        ),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Criado com sucesso!'),
                  ));
                },
                child: Icon(Icons.save),
                backgroundColor: Color.fromARGB(255, 106, 16, 48),
              ),
            )),
      ),
    );
  }
}
