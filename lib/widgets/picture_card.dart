import 'package:flutter/material.dart';

class MyPictureCard extends StatelessWidget {
  const MyPictureCard({
    Key? key,
    this.shape,
    this.color,
    this.onTap,
    this.decoration,
    this.bundle,
    required ImageProvider<Object> image,
  }) : super(key: key);

  final ShapeBorder? shape;
  final Color? color;
  final GestureTapCallback? onTap;
  final Decoration? decoration;
  final AssetBundle? bundle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('bundle'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }
}

// BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// image: const DecorationImage(
// image: AssetImage("assets/images/recebimento.png"),
// fit: BoxFit.cover,
// alignment: Alignment.topCenter,
// ),
// ),
