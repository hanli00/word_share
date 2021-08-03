import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:word_share/pickfile.dart';

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
        body: Text('b'),//Text(WordListState().data[1][1]),
    );
  }
}