
import 'package:sqflite/sqlite_api.dart';

import '../data/projectdb.dart';
import '../model/pedidos.dart';


class PedidosDao {
  static const String tablePedidos = 'pedidos';

  static const String tableSql = 'CREATE TABLE pedidos('
      'id INTEGER PRIMARY KEY, '
      'cliente TEXT, '
      'endereco TEXT, '
      'numero INTEGER, '
      'bairro TEXT, '
      'telefone INTEGER)';

  Future<int> savePedido(Pedido pedido) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> pedidoMap = {};
    pedidoMap['cliente'] = pedido.cliente;
    pedidoMap['endereco'] = pedido.endereco;
    pedidoMap['numero'] = pedido.numero;
    pedidoMap['bairro'] = pedido.bairro;
    pedidoMap['telefone'] = pedido.telefone;

    return db.insert('pedidos', pedidoMap);
  }

  Future<List<Pedido>> findAllPedidos() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('pedidos');
    final List<Pedido> pedidos = [];
    for (Map<String, dynamic> row in result) {
      final Pedido pedido = Pedido(row['id'], row['cliente'], row['endereco'],
          row['numero'], row['bairro'], row['telefone']);
      pedidos.add(pedido);
    }
    return pedidos;
  }

  Future<Pedido> findById(Pedido pedido) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result =
    await db.query(tablePedidos, where: 'id =?', whereArgs: [pedido.id]);
    for (Map<String, dynamic> row in result) {
      final Pedido pedido = Pedido(row['id'], row['cliente'], row['endereco'],
          row['numero'], row['bairro'], row['telefone']);
      break;
    }
    return pedido;
  }

  Future<void> updatePedido(Pedido pedido) async {
    final db = await createDatabase();
    await db.update(
      tablePedidos,
      pedido.toMap(),
      where: 'id = ?',
      whereArgs: [pedido.id],
    );
  }

  Future<void> deletePedido(int id) async {
    final db = await createDatabase();
    await db.delete(
      'pedidos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}



