import 'package:albatros_mobile/widgets/animated_login/animated_login.dart';
import 'package:flutter/material.dart';

import '../pages/sincronizar.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.child,
    this.accountEmail,
    this.accountName,
  }) : super(key: key);

  final Widget child;
  final Widget? accountEmail;
  final Widget? accountName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 106, 16, 48),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: accountName,
              accountEmail: accountEmail,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logoAlbatrosFill.png"),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 106, 16, 48),

              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 106, 16, 48),
                  backgroundImage: AssetImage(
                      "assets/images/userlogo.png"),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color.fromARGB(255, 106, 16, 48),),
              title: Text("Inicio"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box, color: Color.fromARGB(255, 106, 16, 48)),
              title: Text("Cadastros"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_3x3_outlined, color: Color.fromARGB(255, 106, 16, 48)),
              title: Text("Produtos"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Color.fromARGB(255, 106, 16, 48)),
              title: Text("Financeiro"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Color.fromARGB(255, 106, 16, 48)),
              title: Text("Sair"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AnimatedLogin()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
