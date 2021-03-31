import 'package:flutter/material.dart';
import 'package:practica21/src/pages/apiUsuarios_page.dart';
import 'package:practica21/src/pages/formulario_page.dart';
import 'package:practica21/src/pages/secondForm_page.dart';

Map<String, WidgetBuilder> obtenerRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => ApiUsuario(),
    'formulario_dos': (BuildContext context) => SecondFormPage(),
  };
}
