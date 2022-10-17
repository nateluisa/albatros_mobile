import 'package:albatros_mobile/widgets/dashboard.dart';
import 'package:flutter/material.dart';

import '../widgets/menu.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  const HomePage({Key? key, required this.homeContext}) : super(key: key);
  final BuildContext homeContext;
  @override
  Widget build(BuildContext context) {
    return const MyDashboard();
  }
}