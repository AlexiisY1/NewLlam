import 'package:flutter/material.dart';
import 'package:practica21/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      /*theme: ThemeData(
        primaryColor: Colors.blue,
      ),*/
      initialRoute: '/',
      routes: obtenerRutas(),
      // home: HomePage(),
    );
  }
}
