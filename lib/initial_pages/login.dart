import 'package:flutter/material.dart';

import '../widgets/switch.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  const LoginPage({Key? key, required this.loginContext}) : super(key: key);
  final BuildContext loginContext;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 150,
        child: Image.asset('assets/images/logo.png'),
      ),
    );

    final user = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: 'nathalia',
      decoration: InputDecoration(
        label: Text('Usuário'),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        label: Text('Senha'),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final mySwitch = MySwitch(
      title: Text('Salvar dados de login?'),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
                Color.fromARGB(255, 106, 16, 48))),
        onPressed: () {
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 15.0),
            user,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            mySwitch,
            SizedBox(height: 0.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
