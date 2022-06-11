import 'package:flutter/material.dart';

class CalculatriceCombo extends StatefulWidget {
  const CalculatriceCombo({Key? key}) : super(key: key);

  @override
  State<CalculatriceCombo> createState() => _CalculatriceComboState();
}

class _CalculatriceComboState extends State<CalculatriceCombo> {
  //l'objet aui permet de recuperer les elements saisies par l'utilisateur
  // TextEditingController txtnombre1=new TextEditingController();
  // TextEditingController txtnombre2=new TextEditingController();
  // TextEditingController txtsigne=new TextEditingController();
  // TextEditingController txtreponse=new TextEditingController();

  String _selectedLocation = "";
  String dropdownValue = "Add+";
  TextEditingController txtnombre1 = new TextEditingController();
  TextEditingController txtnombre2 = new TextEditingController();
  TextEditingController txtreponse = new TextEditingController();

  void calculer() {
    if (txtnombre1.text == "" || txtnombre2.text == "") {
    } else {
      int a = int.parse(txtnombre1.text);
      int b = int.parse(txtnombre2.text);
      if (dropdownValue == "Add+") {
        txtreponse.text = "" + (a + b).toString();
      } else if (dropdownValue == "sous-") {
        txtreponse.text = "" + (a - b).toString();
      } else if (dropdownValue == "div/") {
        if (a == 0) {
          txtreponse.text = "changer la valuer de premier nombre";
        } else {
          txtreponse.text = "" + (a / b).toString();
        }
      } else if (dropdownValue == "fois*") {
        txtreponse.text = "" + (a * b).toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculatrice"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          new TextField(
              controller: txtnombre1,
              decoration:
                  InputDecoration(labelText: "Nombre1", hintText: "Nombre1")),
          DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>["Add+", "sous-", "div/", "fois*"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          new TextField(
              controller: txtnombre2,
              decoration:
                  InputDecoration(labelText: "nombre2", hintText: "Nombre2")),
          new RaisedButton(
            onPressed: () {
              calculer();
            },
            child: Text("Calculer"),
            color: Colors.blue,
          ),
          new TextField(
            controller: txtreponse,
            decoration:
                InputDecoration(labelText: "reponse", hintText: "Reponse"),
          ),
        ],
      ),
    );
  }
}
