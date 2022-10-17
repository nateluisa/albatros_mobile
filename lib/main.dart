import 'package:albatros_mobile/widgets/animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'initial_pages/home.dart';
import 'initial_pages/login.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(
          loginContext: context,
        ),
    HomePage.tag: (context) => HomePage(
          homeContext: context,
        ),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en', ''), Locale('pt', '')],
      title: 'Albatros vendas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Colors.deepPurple,
        fontFamily: 'Nunito',
      ),
      home: AnimatedLogin(
        logo: Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            //radius: 150,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
      routes: routes,
    );
  }
}
