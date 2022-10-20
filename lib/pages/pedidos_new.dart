import 'package:albatros_mobile/dao/pedidos_dao.dart';
import 'package:albatros_mobile/pages/pedidos.dart';
import 'package:albatros_mobile/widgets/autocomplete_input.dart';
import 'package:albatros_mobile/widgets/button.dart';
import 'package:albatros_mobile/widgets/date_picker.dart';
import 'package:albatros_mobile/widgets/dialog.dart';
import 'package:albatros_mobile/widgets/dropdownmenu.dart';
import 'package:albatros_mobile/widgets/expansible_card.dart';
import 'package:albatros_mobile/widgets/input_money.dart';
import 'package:albatros_mobile/widgets/input_percentual.dart';
import 'package:albatros_mobile/widgets/qr_reader.dart';
import 'package:flutter/material.dart';

import '../model/pedidos.dart';
import '../widgets/input_decimal.dart';
import '../widgets/input_text.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 106, 16, 48),
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
                    padding: const EdgeInsets.only(bottom: 85),
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: MyInputText(
                                        label: Text('Nome'),
                                        controller: _clienteController,
                                        validator: (String? value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Informe o nome';
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: MyInputText(
                                    label: Text('Numero'),
                                    keyboardType: TextInputType.number,
                                    controller: _numeroController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Informe o numero';
                                      }
                                    },
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
                              child: MyInputText(
                                label: Text('Endereço'),
                                controller: _enderecoController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o endereço';
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyInputText(
                                label: Text('Bairro'),
                                controller: _bairroController,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyInputText(
                                icon: Icon(Icons.phone, color: Colors.black),
                                label: Text('Telefone'),
                                keyboardType: TextInputType.phone,
                                controller: _telefoneController,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: MyDatePicker(
                                      dateLabelText: 'Data inicial',
                                      readOnly: false,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: MyDatePicker(
                                      dateLabelText: 'Data final',
                                      readOnly: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child: const MyDropDownMenu(
                                    dropdownItems: [
                                      'Iteeeeeeeeeeeeeeeeem1',
                                      'Item2',
                                      'Item3',
                                      'Item4',
                                      'Item5',
                                      'Item6',
                                      'Item7',
                                      'Item8',
                                      'Item9',
                                      'Item10',
                                      'Item11',
                                      'Item12',
                                      'Item13'
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child: const MyDropDownMenu(
                                    dropdownItems: [
                                      'Iteeeeeeeeeeeeeeeeem1',
                                      'Item2',
                                      'Item3',
                                      'Item4',
                                      'Item5',
                                      'Item6',
                                      'Item7',
                                      'Item8',
                                      'Item9',
                                      'Item10',
                                      'Item11',
                                      'Item12',
                                      'Item13'
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  alignment: AlignmentDirectional.bottomStart,
                                  child: const MyDropDownMenu(
                                    dropdownItems: [
                                      'Iteeeeeeeeeeeeeeeeem1',
                                      'Item2',
                                      'Item3',
                                      'Item4',
                                      'Item5',
                                      'Item6',
                                      'Item7',
                                      'Item8',
                                      'Item9',
                                      'Item10',
                                      'Item11',
                                      'Item12',
                                      'Item13'
                                    ],
                                  )),
                            ),
                            const MyInputMoney(
                              label: Text('Teste de input money',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const MyInputPercentual(
                              label: Text('Teste de input percentual',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const MyInputDecimal(
                                label: Text(
                              'Teste de input decimal',
                              style: TextStyle(color: Colors.black),
                            )),
                            MyButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                print('object');
                              },
                              label: Text('Click'),
                            ),
                            //MyAutocomplete(),
                            InputAutocomplete(
                              suggestons: [
                                "Teste1",
                                "Teste2",
                                "Teste3",
                                "Teste4",
                                "Teste5",
                                "Teste6",
                                "Teste7",
                                "Teste8",
                              ],
                              label: Text('Buscar'),
                            ),

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
                                              content: const Text(
                                                  'Teste de subtitulo ou conteudo de dialog'),
                                              title: const Text(
                                                  'Teste de title de dialogo'),
                                              icon: const Icon(
                                                Icons.warning_rounded,
                                                size: 45,
                                                color: Colors.yellow,
                                              ));
                                        });
                                  },
                                  child: const Text('Dialog')),
                            ),
                            MyButton(label: Text('QR code'), icon: Icon(Icons.qr_code), onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  MyQRReader()),
                            ); }, ),
                            MyExpansibleCard(
                              title: Text('Teste de expansible card'),
                              subtitle: Text('Subtitulo'),
                              child: Text('Child do widget'),
                              leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                                    'assets/images/logoAlbatrosMini.png',
                                  )),
                            ),

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
                child: const Icon(Icons.save),
                backgroundColor: const Color.fromARGB(255, 106, 16, 48),
              ),
            )),
      ),
    );
  }
}
