import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({Key? key}) : super(key: key);

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  TextEditingController txtnombre1 = new TextEditingController();
  TextEditingController txtnombre2 = new TextEditingController();
  TextEditingController txtresult = new TextEditingController();

  void addition() {
    int n1 = int.parse(txtnombre1.text);
    int n2 = int.parse(txtnombre2.text);
    txtresult.text = (n1 + n2).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATRICE"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Row(
            children: [
              new TextField(
                controller: null,
                decoration: InputDecoration(
                  labelText: "Nombre1",
                  hintText: "Nombre1",
                ),
              ),
              SizedBox(
                width: 20,
              ),
              new TextField(
                controller: txtnombre2,
                decoration: InputDecoration(
                    labelText: "Nombre 2", hintText: "Entre votre nombre2"),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () {
                  addition();
                },
                child: Text("Enregistrer"),
                color: Colors.blue,
              ),
              SizedBox(width: 20),
              new TextField(
                controller: txtresult,
                enabled: true,
                decoration: InputDecoration(
                    labelText: "Resultat", hintText: "Entre votre reponse"),
              )
            ],
          )
        ],
      ),
    );
  }
}
