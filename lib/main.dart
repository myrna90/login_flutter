import 'package:flutter/material.dart';
import 'package:flutter_form_validation/src/bloc/provider.dart';
import 'package:flutter_form_validation/src/pages/home_page.dart';
import 'package:flutter_form_validation/src/pages/login_page.dart';
import 'package:flutter_form_validation/src/pages/product_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //este es el padre de toda la app
    //con la implementación del Provider este pasa a
    //ser el padre de toda la App y materialApp pasa a ser su hijo.
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/login': (BuildContext context) => LoginPage(),
          '/home': (BuildContext context) => HomePage(),
          '/producto': (BuildContext context) => ProductPage(),
        },
        theme: ThemeData(primaryColor: Colors.lightGreen),
      ),
    );
  }
}
