import 'package:albatros_mobile/widgets/animated_login/animated_login.dart';
import 'package:albatros_mobile/widgets/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'initial_pages/home.dart';
import 'initial_pages/login.dart';




void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
     MyApp(),
  );
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
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate,],
      supportedLocales: const [Locale('en'), Locale('pt')],
      locale: const Locale('pt'),
      title: 'Albatros vendas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Colors.deepPurple,
        fontFamily: 'Nunito',
      ),
      home:LoginPage(loginContext: context,),
      // AnimatedLogin(
      //   validateName: true,
      //   signUpMode: SignUpModes.name,
      //   onLogin: LoginFunctions(context).onLogin,
      //   logo: Image.asset('assets/images/initiallogo.png'),
      // ),
      routes: routes,
    );
  }
}

class LoginFunctions {
  /// * e.g. [onLogin], [onSignup] and [onForgotPassword]
  const LoginFunctions(this.context);

  final BuildContext context;

  Future<String?> onLogin(LoginData loginData) async {
    // DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const MyDashboard()),
    );
    //Navigator.of(context).pushNamed('/home-page');
    //DialogBuilder(context).showResultDialog('Login realizado');
    return null;
  }

  Future<String?> onSignup(SignUpData signupData) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilder(context).showResultDialog('Solicitação enviada!');
    return null;
  }

  Future<String?> onForgotPassword(String email) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    // You should determine this path and create the screen.
    // Navigator.of(context).pushNamed('/forgotPass');
    return null;
  }
}

class DialogBuilder {
  /// * e.g. [showLoadingDialog], [showResultDialog]
  const DialogBuilder(this.context);

  final BuildContext context;

  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(
            content: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(
                  //color: Theme.of(context).primaryColor,
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ),
      );

  /// Example result dialog
  Future<void> showResultDialog(String text) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text(text, textAlign: TextAlign.center)),
          ),
        ),
      );
}
