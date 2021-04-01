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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Alexis Yarid Sánchez'),
          backgroundColor: Colors.black,
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
                    child: Icon(
                      Icons.verified,
                      size: 80,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Nombre completo',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Ejemplo: Alexis Yarid Sánchez Vergara',
                      prefixIcon: Icon(
                        Icons.person_outline_sharp,
                        color: Colors.black,
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
                      labelStyle: TextStyle(color: Colors.black),
                      hintText:
                          'Ejemplo: Venustiano Carranza #57, col.miradores',
                      prefixIcon: Icon(
                        Icons.home_outlined,
                        color: Colors.black,
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
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Ejemplo: 76850',
                      prefixIcon: Icon(
                        Icons.fence_outlined,
                        color: Colors.black,
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
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'ejemplo: alguien@example.com',
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.black,
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
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Ejemplo: 1234567',
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
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
                    color: Colors.yellow,
                    textColor: Colors.black,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        if (nombre.compareTo('Sánchez Vergara Alexis Yarid') ==
                                0 &&
                            direccion.compareTo(
                                    'Camino Real a Contepec #5 Col.El Pinar') ==
                                0 &&
                            postal.compareTo('76850') == 0 &&
                            email.compareTo('yarid-sanchez984@gmail.com') ==
                                0 &&
                            password.compareTo('325yt425gs') == 0) {
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
