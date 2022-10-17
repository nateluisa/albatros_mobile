class Pedido {
  final int id;
  String cliente;
  String endereco;
  int numero;
  String bairro;
  int telefone;

  Pedido(this.id, this.cliente, this.endereco, this.numero, this.bairro,
      this.telefone);

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente': cliente,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'telephone': telefone,
    };
  }
}
