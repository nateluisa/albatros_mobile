import 'package:albatros_mobile/widgets/animated_login/animated_login.dart';
import 'package:flutter/material.dart';

import '../main.dart';

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
        backgroundColor: const Color.fromARGB(255, 106, 16, 48),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: accountName,
              accountEmail: accountEmail,
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/logoAlbatrosFill.png"),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 106, 16, 48),

              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 106, 16, 48),
                  backgroundImage: AssetImage(
                      "assets/images/userlogo.png"),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color.fromARGB(255, 106, 16, 48),),
              title: const Text("Inicio"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_box, color: Color.fromARGB(255, 106, 16, 48)),
              title: const Text("Cadastros"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_3x3_outlined, color: Color.fromARGB(255, 106, 16, 48)),
              title: const Text("Produtos"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on, color: Color.fromARGB(255, 106, 16, 48)),
              title: const Text("Financeiro"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color.fromARGB(255, 106, 16, 48)),
              title: const Text("Sair"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AnimatedLogin(
                        logo: Image.asset('assets/images/initiallogo.png'),
                        onLogin: LoginFunctions(context).onLogin,
                      )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
