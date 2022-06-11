import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class Persoonne extends StatefulWidget {
  const Persoonne({Key? key}) : super(key: key);

  @override
  State<Persoonne> createState() => _PersoonneState();
}

class _PersoonneState extends State<Persoonne> {
  TextEditingController txtnom = new TextEditingController();
  TextEditingController txtadresse = new TextEditingController();
  TextEditingController txttelephone = new TextEditingController();
  TextEditingController txtid = new TextEditingController();

  Future<void> AddData() async {
    try {
      var url = "http://192.168.41:8191/isig_2022/postdata.php";
      final response = await http.post(Uri.parse(url), Body: {
        "noms": txtnom,
        "adresse": txtadresse,
        "telephone": txttelephone
      });
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> DeleteData() async {
    try {
      var url = "http://192.168.41:8191/isig_2022/delete.php";
      final response = await http.post(Uri.parse(url), Body: {
        // "noms": txtnom,
        //"adresse": txtadresse,
        //"telephone": txttelephone
        "id": txtid.text
      });
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> UpdateData() async {
    try {
      var url = "http://192.168.41:8191/isig_2022/update.php";
      final reponse = await http.post(Uri.parse(url), Body: {
        "noms": txtnom,
        "adresse": txtadresse,
        "telephone": txttelephone,
        "id": txtid.text
      });
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> getData() async {
    var url = "http://192.168.41:81/isig_2022/getdata.php";
    final reponse = await http.get(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IDENTIFICATION"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          new TextField(
            controller: txtid,
            decoration: InputDecoration(
              labelText: "Entre votre id",
              hintText: "Entre votre id",
            ),
          ),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txtnom,
            decoration: InputDecoration(
                labelText: "Entre votre Nom", hintText: "Entre votre Nom"),
          ),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txtadresse,
            decoration: InputDecoration(
                labelText: "Entre votre Adresse",
                hintText: "Entre votre Adresse"),
          ),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txttelephone,
            decoration: InputDecoration(
                labelText: "Entre votre contact",
                hintText: "Entre votre contact"),
          ),
          SizedBox(width: 20),
          new RaisedButton(
            onPressed: () {
              AddData();
            },
            child: Text("Enregistrer"),
            color: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
          new RaisedButton(
            onPressed: () {
              UpdateData();
            },
            child: Text("Modifier"),
            color: Colors.cyan,
          ),
          SizedBox(
            width: 20,
          ),
          new RaisedButton(
            onPressed: () {
              DeleteData();
            },
            child: Text("Delete"),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
