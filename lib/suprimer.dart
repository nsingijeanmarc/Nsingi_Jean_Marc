import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hyhh/editdata.dart';
import 'package:hyhh/main.dart';
import 'package:http/http.dart';
class Suppression extends StatefulWidget {
  List list;
  int index;
  Suppression({this.list, this.index});

  @override
  State<Suppression> createState() => _SuppressionState();
}

class _SuppressionState extends State<Suppression> {
  void deleteData() {
    var url = "http://192.168.41:81/isig_2022/postdata.php";
    http.post(url, body: {'nom': widget.list[widget.index]['nom']
    });
  }
  void confirm()
  {
    AlertDialog alertDialog=new AlertDialog(
      content: Text("voulez vous supprimer ${widget.list[widget.index]['nom']}"),
      actions: <Widget>[
        new RaisedButton(
          child: Text("ok Delete",style: new TextStyle(color: Colors.black),
          ),
        ),
        onPressed:(){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              Builder:(BuildContext context)=>new Home(),
            )
          );
        },
        Color: Colors.red,
    ),
    new RaisedButton(
      child: Text("CANCEL",style:new TextStyle(Color:Colors.black),),
      Color:Colors.green,
      onPressed: (){
        Navigator.of(context).pop();
      },
    ),

      ],
    );
    showDialog(context: context, child: alertDialog)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['nom']}"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                widget.list[widget.index]['nom']
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                widget.list[widget.index]['nom'],
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                widget.list[widget.index]['Adresse'],
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                widget.list[widget.index]['Telephone'],
                style: new TextStyle(fontSize: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: <Widget>[
                  RaisedButton(
                    child: Text("SPM"),
                    color: Colors.green,
                    onPressed: ()=> Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder:(BuildContext context)=>new EditData(List:widget.list,index:widget.index)
                         )
                    ),
                  )
                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}
