import 'package:flutter/material.dart';

class Calculatore extends StatefulWidget {
  const Calculatore({Key? key}) : super(key: key);

  @override
  State<Calculatore> createState() => _CalculatoreState();
}

class _CalculatoreState extends State<Calculatore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculatore"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Row(
            children: [
              new TextField(
                controller: null,
              )
            ],
          )
        ],
      ),
    );
  }
}
