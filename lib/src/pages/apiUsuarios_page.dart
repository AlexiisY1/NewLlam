import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practica21/models/results_models.dart';

// ignore: camel_case_types
class ApiUsuario extends StatefulWidget {
  @override
  ApiUsuarioState_page createState() => ApiUsuarioState_page();
}

// ignore: camel_case_types
class ApiUsuarioState_page extends State<ApiUsuario> {
  Model model;
  List<Results> list;
  Future getDataFromApi() async {
    final url =
        await http.get(Uri.parse("https://randomuser.me/api/?results=20"));
    if (url.statusCode == 200) {
      model = Model.fromJson(jsonDecode(url.body));
      setState(() {
        list = model.results;
      });
    } else {
      throw Exception('Error');
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('API Usuarios - Sánchez Vergara Alexis Yarid'),
          backgroundColor: Colors.green),
      body: list == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, i) {
                final k = list[i];

                return Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(k.picture.large),
                    ),
                    Text(k.name.first + " " + k.name.last),
                    Text(k.gender),
                    Text(k.phone),
                    Text(k.location.country),
                  ],
                );
              },
            ),
    );
  }
}
