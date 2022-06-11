import 'package:flutter/material.dart';
import 'package:myfirstprojet/main.dart';
import 'package:http/http.dart' as http;

class Modification extends StatefulWidget {
  const Modification({Key? key}) : super(key: key);

  @override
  State<Modification> createState() => _ModificationState();
}

class _ModificationState extends State<Modification> {
  TextEditingController txtnom = new TextEditingController();
  TextEditingController txtadresse = new TextEditingController();
  TextEditingController txttelephone = new TextEditingController();
  void editData() async {
    try {
      var url = "http://192.168.41:81/isig_2022/postdata.php";
      final response = await http.post(Uri.parse(url), Body: {
        "nom": txtnom,
        "Adresse": txtadresse,
        "Telephone": txttelephone
      });
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  void initState() {
    txtnom = new TextEditingController(text: widget.list[widget.index]['nom']);
    txtadresse =
        new TextEditingController(text: widget.list[widget.index]['Adresse']);
    txttelephone =
        new TextEditingController(text: widget.list[widget.index]['Telephone']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Modifie"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: txtnom,
                  decoration: new InputDecoration(
                    hintText: "Nom",
                    labelText: "Nom",
                  ),
                ),
                new TextField(
                  controller: txtadresse,
                  decoration: new InputDecoration(
                    hintText: "Adresse",
                    labelText: "Adresse",
                  ),
                ),
                new TextField(
                  controller: txttelephone,
                  decoration: new InputDecoration(
                    hintText: "Telephone",
                    labelText: "Telephon",
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new RaisedButton(
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()),
                    );
                  },
                  child: new Text("editer les donnee"),
                  color: Colors.deepOrange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
