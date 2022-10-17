import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';


class MyExpansibleCard extends StatefulWidget {
  MyExpansibleCard({Key? key, required this.title, required this.subtitle, required this.child, }) : super(key: key);

  final Widget title;
  final Widget subtitle;
  final Widget child;

  @override
  _MyExpansibleCardState createState() => _MyExpansibleCardState();
}

class _MyExpansibleCardState extends State<MyExpansibleCard> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 1.0, right: 1.0, bottom: 8.0),
      child: Card(
        elevation: 2,
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ExpansionTileCard(
          isThreeLine: true,
          key: cardA,
          leading: CircleAvatar(child: Image.asset('assets/images/userlogo.png')),
          title: widget.title,
          subtitle: widget.subtitle,
          children: <Widget>[
            Divider(
              thickness: 1.0,
              height: 1.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 14.0,
                ),
                child: widget.child
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              buttonHeight: 52.0,
              buttonMinWidth: 90.0,
              children: <Widget>[
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    cardA.currentState?.expand();
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(Icons.arrow_downward, color: Color.fromARGB(255, 106, 16, 48)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Text('Abrir', style: TextStyle(
                          color: Color.fromARGB(255, 106, 16, 48)
                      ),),
                    ],
                  ),
                ),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    cardA.currentState?.collapse();
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(Icons.arrow_upward, color: Color.fromARGB(255, 106, 16, 48)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Text('Fechar', style: TextStyle(
                          color: Color.fromARGB(255, 106, 16, 48)
                      ),),
                    ],
                  ),
                ),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    cardA.currentState?.toggleExpansion();
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(Icons.swap_vert, color: Color.fromARGB(255, 106, 16, 48)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Text('Clique', style: TextStyle(
                          color: Color.fromARGB(255, 106, 16, 48)
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}