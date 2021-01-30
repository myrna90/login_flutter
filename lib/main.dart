import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_validation/src/bloc/provider.dart';
import 'package:flutter_form_validation/src/user_preferences/user_preferences.dart';
import 'package:flutter_form_validation/src/bloc/provider.dart';
import 'package:flutter_form_validation/src/pages/home_page.dart';
import 'package:flutter_form_validation/src/pages/login_page.dart';
import 'package:flutter_form_validation/src/pages/product_page.dart';
import 'package:flutter_form_validation/src/pages/register_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  final prefs = new UserPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
    //este es el padre de toda la app
    //con la implementación del Provider este pasa a
    //ser el padre de toda la App y materialApp pasa a ser su hijo.
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => LoginPage(),
          '/registro': (BuildContext context) => RegisterPage(),
          '/home': (BuildContext context) => HomePage(),
          '/producto': (BuildContext context) => ProductPage(),
        },
        theme: ThemeData(primaryColor: Colors.lightGreen),
      ),
    );
  }
}
