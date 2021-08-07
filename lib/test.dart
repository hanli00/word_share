import 'package:flutter/material.dart';
import 'dart:math';

class Test extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  var index = 0;
  var score = 0;
  var questions = [
    'apple',
    'banana',
    'candy',
    'dog',
    'egg',
  ];
  var asked = List.filled(1, 0, growable: false);

  void scoreadd(){
    setState(() {
      if (index < 4) {
        score = score + 1;
        questionindex();
      }
    });
  }

  int Randnum(List<String> list){
    return Random().nextInt(list.length);
  }

  void questionindex(){
    setState(() {
      if (index < 4){
        index = index + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    var randnum = Randnum(questions);
    for (int i = 0; i < 10; i++){
      if(randnum == i){
        break;
      } else {
        asked.add(i);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          Text(questions[randnum]),
          Center(
            child: Row(
                children: [
                  ElevatedButton(
                      child: Text('O'),
                      onPressed: (){
                        scoreadd();
                      }
                  ),
                  ElevatedButton(
                      child: Text('X'),
                      onPressed: () {
                        questionindex();
                      }
                  ),
                ]
            ),
          ),
          Text(score.toString()),
        ],
      ),
    );
  }
}