import 'package:flutter/material.dart';
import '../initial_pages/login.dart';
import 'dashboard1.dart';

void main() {
  runApp(const Menu());
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  bool visivel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          SizedBox(
            width: 80.0,
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
                      child: Text('Usuário: Isadora'),
                    ),
                    const PopupMenuItem<String>(
                      value: '2',
                      child: Text('Precisa de ajuda?'),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (BuildContext context) => LoginPage(loginContext: context)));
                        // Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (newContext) =>
                        //           LoginPage(loginContext: context)),
                        // );
                      },
                      value: '3',
                      child: const Text('Sair'),
                    ),
                  ];
                }),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 49, 63, 137),
        automaticallyImplyLeading: false,
        title: const Text(''),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Color.fromARGB(255, 49, 63, 137),
          ],
        )),
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: visivel ? 1 : 0,
            child: const FirstDashboard()),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromARGB(255, 49, 63, 137),
      //   onPressed: () {
      //     setState(() {
      //       visivel = !visivel;
      //     });
      //   },
      //   tooltip: 'Visibilidade da dashboard',
      //   child: const Icon(Icons.remove_red_eye),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.blueAccent[100],
      bottomNavigationBar: MyBottomAppBar(
        fabLocation: _fabLocation,
      ),
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: const Color.fromARGB(255, 49, 63, 137),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Configurações',
              icon: const Icon(Icons.settings),
              onPressed: () {


              },
            ),
          ],
        ),
      ),
    );
  }
}
