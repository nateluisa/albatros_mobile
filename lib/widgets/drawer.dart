import 'package:flutter/material.dart';

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
              ),
              child: child,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu1'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu1'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu1'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu1'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu1'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text('Menu1'),
            ),
          ],
        ),
      ),
    );
  }
}
