import 'package:albatros_mobile/dao/pedidos_dao.dart';
import 'package:albatros_mobile/model/pedidos.dart';
import 'package:albatros_mobile/pages/pedidos_edit.dart';
import 'package:albatros_mobile/pages/pedidos_new.dart';
import 'package:albatros_mobile/pages/pedidos_view.dart';
import 'package:albatros_mobile/widgets/dashboard.dart';
import 'package:albatros_mobile/widgets/dialog.dart';
import 'package:flutter/material.dart';

import '../widgets/progress.dart';

class Pedidos extends StatelessWidget {
  final PedidosDao _dao = PedidosDao();

  Pedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => const MyDashboard(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 65.0),
          child: Text('PEDIDOS'),
        )),
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
      ),
      body: FutureBuilder(
        future: _dao.findAllPedidos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return const Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.data != null) {
                final List<Pedido> pedidos = snapshot.data as List<Pedido>;
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 85),
                  itemBuilder: (context, index) {
                    final Pedido pedido = pedidos[index];
                    return _PedidoItem(pedido);
                  },
                  itemCount: pedidos.length,
                );
              }
              break;
          }
          return const Text('Erro ao realizar carregamento');
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => PedidosNewScreen(
                clientsNewContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
      ),
    );
  }
}

class _PedidoItem extends StatelessWidget {
  // widget privado que fara parte apenas da tela pedidoe - lista
  late final Pedido pedido;
  final PedidosDao _dao = PedidosDao();

  _PedidoItem(this.pedido);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      shadowColor: Colors.blueGrey,
      child: ListTile(
        trailing: PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: '1',
                  child: const Text('Editar'),
                  onTap: () {
                    _dao.findById(pedido).then((cli) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PedidosEditScreen(),
                        )));
                  },
                ),
                PopupMenuItem<String>(
                  value: '2',
                  onTap: () {
                    _dao.findById(pedido).then((cli) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PedidosViewScreen(),
                        )));
                  },
                  child: const Text('Visualizar'),
                ),
                PopupMenuItem<String>(
                  onTap: () {
                    print('passou pelo dialog');
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MyAlertDialog(
                              onConfirm: () {
                                _dao
                                    .deletePedido(pedido.id)
                                    .then((id) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Pedidos(),
                                        )));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Pedido deletado!'),
                                ));
                              },
                              onCancel: () {},
                              content: const Text(
                                  'Após a exclusão não será possivel recuperar os dados!'),
                              title: const Text('Deseja excluir o pedido?'),
                              icon: const Icon(Icons.warning_rounded));
                        });
                    print('delete');
                    _dao.deletePedido(pedido.id).then((id) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Pedidos(),
                        )));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 800),
                      content: Text('Pedido deletado!'),
                    ));
                  },
                  value: '3',
                  child: const Text('Excluir'),
                ),
              ];
            }),
        title: Text(
          pedido.cliente,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          pedido.endereco,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
