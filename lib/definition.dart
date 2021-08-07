import 'package:flutter/material.dart';
import 'pickfile.dart';

class Definition extends StatefulWidget{
  @override
  DefinitionState createState() => DefinitionState();
}

class DefinitionState extends State<Definition> {
  var INDEX = WordListState().INDEX;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(INDEX.toString()),
    ),
        body: //Text('b'),
              Text(WordListState().data.toString()),
    );
  }
}