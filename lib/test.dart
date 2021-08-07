import 'package:flutter/material.dart';

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

  void scoreadd(){
    setState(() {
      if (index < 4) {
        score = score + 1;
        questionindex();
      }
    });
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          Text(questions[index]),
          Row(
            children: [
              ElevatedButton(
                  onPressed: scoreadd,
                  child: Text('O')
              ),
              ElevatedButton(
                  onPressed: questionindex,
                  child: Text('X')
              ),
            ]
          ),
          Text(score.toString()),
        ],
      ),
    );
  }
}