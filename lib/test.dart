import 'package:flutter/material.dart';
import 'dart:math';

class Test extends StatefulWidget {
  Test(this.data);
  List<List<dynamic>> data;
  @override
  TestState createState() => TestState(data);
}

class TestState extends State<Test> {
  TestState(this.data);
  List<List<dynamic>> data;
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
      if (index < 5) {
        score = score + 1;
        questionindex();
      }
    });
  }

  List<String> Randnum(List<List<dynamic>> list){
    int randnum;
    List<String> question = ['',''];
    if (list.length != 0){
      randnum = Random().nextInt(list.length);
      question[0] = list[randnum][1];
      question[1] = list[randnum][2];
      list.removeAt(randnum);
    } else {
      question = [];
    }
    return question;
  }

  void questionindex(){
    setState(() {
      if (index < 5){
        index = index + 1;
      }
    });
  }

  String questioncontent(List<String> question){
    String finish = 'finish';
    String indexquestion = '${index+1} ${question[0]}\n ${question[1]}';
    if (index == 5){
      return finish;
    } else {
      return indexquestion;
    }
  }

  @override
  Widget build(BuildContext context){
    var question = Randnum(data);
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
          Text('Score: ${score.toString()}'),
        ],
      ),
    );
  }
}