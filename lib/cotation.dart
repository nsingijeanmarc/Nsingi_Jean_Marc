import 'package:flutter/material.dart';

class Cotation extends StatefulWidget {
  const Cotation({Key? key}) : super(key: key);

  @override
  State<Cotation> createState() => _CotationState();
}

class _CotationState extends State<Cotation> {
  //l'objet aui permet de recuperer les elements saisies par l'utilisateur
  TextEditingController txtAlgorithmique = new TextEditingController();
  TextEditingController txtMathematique = new TextEditingController();
  TextEditingController txtLangageC = new TextEditingController();
  TextEditingController txtStatistique = new TextEditingController();
  TextEditingController txtPourcentage = new TextEditingController();
  TextEditingController txtMention = new TextEditingController();

  void calculer() {
    double pointAlgo = double.parse(txtAlgorithmique.text);
    double pointMath = double.parse(txtMathematique.text);
    double pointStat = double.parse(txtStatistique.text);
    double pointLangageC = double.parse(txtLangageC.text);

    double pourcentage =
        ((pointAlgo + pointMath + pointStat + pointLangageC) * 100) / 190;

    txtPourcentage.text = pourcentage.toString() + " %";
    if (pourcentage < 50 && pourcentage >= 40) {
      txtMention.text = "A";
    } else if (pourcentage >= 50 && pourcentage <= 69) {
      txtMention.text = "S";
    } else if (pourcentage > 69 && pourcentage <= 79) {
      txtMention.text = "D";
    } else if (pourcentage >= 80 && pourcentage <= 89) {
      txtMention.text = "GD";
    } else if (pourcentage >= 90 && pourcentage <= 100) {
      txtMention.text = "TGD";
    } else if (pourcentage >= 30 && pourcentage < 40) {
      txtMention.text = "NAF";
    } else {
      txtMention.text = "cote Invalide";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cotation"),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView(
        children: [
          new TextField(
              controller: txtAlgorithmique,
              decoration: InputDecoration(
                  labelText: "Algorithmique /40",
                  hintText: "Entrer le points")),
          new TextField(
              controller: txtMathematique,
              decoration: InputDecoration(
                  labelText: "Mathematique /50", hintText: "Entrer le points")),
          new TextField(
              controller: txtStatistique,
              decoration: InputDecoration(
                  labelText: "Statistique /40", hintText: "Entrer le points")),
          new TextField(
              controller: txtLangageC,
              decoration: InputDecoration(
                  labelText: "Langage C /60", hintText: "Entrer le points")),
          new RaisedButton(
            onPressed: () {
              calculer();
            },
            child: Text("Calculer"),
            color: Colors.greenAccent,
          ),
          new TextField(
            controller: txtPourcentage,
            decoration: InputDecoration(
                labelText: "Pourcentage", hintText: "Pourcentae"),
          ),
          new TextField(
            controller: txtMention,
            decoration:
                InputDecoration(labelText: "Mention", hintText: "Mention"),
          ),
        ],
      ),
    );
  }
}
