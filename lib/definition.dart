import 'package:flutter/material.dart';

class Definition extends StatefulWidget{
  Definition(this.INDEX, this.data);
  int INDEX;
  List<List<dynamic>> data = [];
  @override
  DefinitionState createState() => DefinitionState(INDEX, data);
}

class DefinitionState extends State<Definition> {
  DefinitionState(this.INDEX, this.data);
  var INDEX;
  List<List<dynamic>> data = [];

  void INDEXIncrease(){
    setState(() {
      INDEX = INDEX + 1;
    });
  }

  void INDEXDecrease(){
    setState(() {
      INDEX = INDEX - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(INDEX.toString()),
    ),
        body: Column(
          children: [
            Text(data[INDEX][1]),
            Text(data[INDEX][2].toString()),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    INDEXIncrease();
                  },
                  child: Text('Next'),
                ),
                ElevatedButton(
                  onPressed: () {
                    INDEXDecrease();
                  },
                  child: Text('Back'),
                )
              ]
            )
          ],
        )
    );
  }
}