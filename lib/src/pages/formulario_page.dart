import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  FocusNode nombreFocus;
  FocusNode direccionFocus;
  FocusNode postalFocus;
  FocusNode emailFocus;
  FocusNode passwordFocus;

  String nombre;
  String direccion;
  String postal;
  String email;
  String password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('Ekatherine García'),
          backgroundColor: Colors.pink[200],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  /*width: 150.0,
                  height: 150.0,*/
                  child: Center(
                    child: Image.network(
                        'https://1000marcas.net/wp-content/uploads/2020/02/Est%C3%A9e-Lauder-Logo-tumb.jpg'),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Nombre completo',
                      labelStyle: TextStyle(color: Colors.pink[200]),
                      hintText: 'Ejemplo: Ana María López Pérez',
                      prefixIcon: Icon(
                        Icons.person_outline_sharp,
                        color: Colors.pink[200],
                      )),
                  //controller: nombreTextController,
                  onSaved: (value) {
                    nombre = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'vacío';
                    }
                  },
                  focusNode: this.nombreFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Dirección',
                      labelStyle: TextStyle(color: Colors.pink[200]),
                      hintText: 'Ejemplo: Cerro no.2, col. El Doraro',
                      prefixIcon: Icon(
                        Icons.home_outlined,
                        color: Colors.pink[200],
                      )),
                  //controller: nombreTextController,
                  onSaved: (value) {
                    direccion = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'vacío';
                    }
                  },
                  focusNode: this.direccionFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Código Postal',
                      labelStyle: TextStyle(color: Colors.pink[200]),
                      hintText: 'Ejemplo: 76805',
                      prefixIcon: Icon(
                        Icons.fence_outlined,
                        color: Colors.pink[200],
                      )),
                  //controller: nombreTextController,
                  onSaved: (value) {
                    postal = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'vacío';
                    }
                  },
                  focusNode: this.postalFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Correo',
                      labelStyle: TextStyle(color: Colors.pink[200]),
                      hintText: 'ejemplo@example.com',
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.pink[200],
                      )),
                  //controller: apTextController,
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'vacío';
                    }
                  },
                  focusNode: this.passwordFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.pink[200]),
                        hintText: 'Ejemplo: A1h%gR4&',
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.pink[200],
                        )),
                    //controller: apTextController,
                    onSaved: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo vacio';
                      }
                    }),
                SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: 340.0,
                  height: 50.0,
                  /* decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.pink, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                  ),*/
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.pink[200],
                    textColor: Colors.white,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        if (nombre.compareTo('Ekatherine Garcia') == 0 &&
                            direccion.compareTo('Esperanza no.2') == 0 &&
                            postal.compareTo('76805') == 0 &&
                            email.compareTo('eka@gmail.com') == 0 &&
                            password.compareTo('eka123') == 0) {
                          Navigator.pushNamed(context, 'formulario_dos',
                              arguments: Argumentos(
                                  nombre: this.nombre,
                                  direccion: this.direccion,
                                  postal: this.postal,
                                  email: this.email,
                                  password: this.password));
                        } else {
                          Navigator.pushNamed(context, 'formulario_dos',
                              arguments: Argumentos(
                                  nombre: this.nombre,
                                  direccion: this.direccion,
                                  postal: this.postal,
                                  email: this.email,
                                  password: this.password));
                        }
                      }
                    },
                    child: Text('Registrarse'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus();
  }

  @override
  void initState() {
    super.initState();

    nombreFocus = FocusNode();
    direccionFocus = FocusNode();
    postalFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nombreFocus.dispose();
    direccionFocus.dispose();
    postalFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }
}

class Argumentos {
  String nombre;
  String direccion;
  String postal;
  String email;
  String password;

  Argumentos(
      {this.nombre, this.direccion, this.postal, this.email, this.password});
}
