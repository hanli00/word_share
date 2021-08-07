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
  var asked = List.filled(1, 0, growable: true);

  void scoreadd(){
    setState(() {
      if (index < 4) {
        score = score + 1;
        questionindex();
      }
    });
  }

  String Randnum(List<String> list){
    int randnum;
    String question;
    if (list.length != 0){
      randnum = Random().nextInt(list.length);
      question = list[randnum];
      list.removeAt(randnum);
    } else {
      question = '0';
    }
    return question;
  }

  void questionindex(){
    setState(() {
      if (index < 4){
        index = index + 1;
      }
    });
  }

  String questioncontent(String question){
    String finish = 'finish';
    String indexquestion = '${index+1} ${question}';
    if (index == 5){
      return finish;
    } else {
      return indexquestion;
    }
  }

  @override
  Widget build(BuildContext context){
    var question = Randnum(questions);
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          Text(questioncontent(question)),
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