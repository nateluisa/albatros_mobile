import 'package:albatros_mobile/initial_pages/login.dart';
import 'package:albatros_mobile/pages/configuracao.dart';
import 'package:albatros_mobile/pages/pedidos.dart';
import 'package:albatros_mobile/pages/produtos.dart';
import 'package:flutter/material.dart';

import '../pages/clientes.dart';
import '../pages/sincronizar.dart';
import 'menu.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          SizedBox(
            width: 60,
            child: PopupMenuButton<String>(
                icon: ClipOval(
                  child: Align(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: Image.asset('assets/images/userlogo.png'),
                  ),
                ),
                // onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: '1',
                      child: Text('Usuário: Cara da saúde'),
                    ),
                    const PopupMenuItem<String>(
                      value: '2',
                      child: Text('Precisa de ajuda?'),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                       // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (newContext) =>
                                  LoginPage(loginContext: context)),
                        );
                      },
                      value: '3',
                      child: const Text('Sair'),
                    ),
                  ];
                }),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => LoginPage(loginContext: context,),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Color.fromARGB(255, 106, 16, 48),
          ],
        )),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 1,
          mainAxisSpacing: 3,
          crossAxisCount: 1,
          primary: false,
          childAspectRatio: 10 / 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(1),
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Pedidos()
                      ),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 65, top: 2),
                            child: ListTile(
                              leading: Icon(
                                Icons.shopping_basket_outlined,
                                size: 50,
                                color: Color.fromARGB(255, 106, 16, 48),
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(top: 26),
                                child: Text(
                                  'PEDIDOS',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              subtitle: Text(''),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              // TextButton(
                              //   child: const Text('REMOVER'),
                              //   onPressed: () {
                              //
                              //   },
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Produtos()
                      ),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 55, top: 2),
                            child: ListTile(
                              leading: Icon(
                                Icons.spoke,
                                size: 50,
                                color: Color.fromARGB(255, 106, 16, 48),
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Text(
                                  'PRODUTOS',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              subtitle: Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Clientes()
                      ),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 65, top: 2),
                            child: ListTile(
                              leading: Icon(
                                Icons.account_circle_outlined,
                                size: 50,
                                color: Color.fromARGB(255, 106, 16, 48),
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Text(
                                  'CLIENTES',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              subtitle: Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextNew) => Configuracao(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30, top: 2),
                            child: ListTile(
                              leading: Icon(
                                Icons.settings,
                                size: 50,
                                color: Color.fromARGB(255, 106, 16, 48),
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Text(
                                  'CONFIGURAÇÃO',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              subtitle: Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              child: SizedBox(
                height: 120,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Sincronizar()
                      ),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 35, top: 2),
                            child: ListTile(
                              leading: Icon(
                                Icons.compare_arrows,
                                size: 50,
                                color: Color.fromARGB(255, 106, 16, 48),
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Text(
                                  'SINCRONIZAR',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              subtitle: Text(''),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              // TextButton(
                              //   child: const Text('REMOVER'),
                              //   onPressed: () {
                              //
                              //   },
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
