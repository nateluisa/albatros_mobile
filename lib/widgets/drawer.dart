import 'package:flutter/material.dart';

import '../pages/sincronizar.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 106, 16, 48),
              ), child: child,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.account_circle_sharp, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu1'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.account_balance_outlined, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu2'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.add_chart_sharp, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu3'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Sincronizar()
                  ),
                );
              },
              leading: const Icon(Icons.account_tree_outlined, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu4'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.add_a_photo_rounded, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu5'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu6'),
            ),
          ],
        ),
      ),
    );
  }
}
