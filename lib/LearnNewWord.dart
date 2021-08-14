import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LearnNewWords extends StatefulWidget{
  @override
  LearnNewWordsState createState() => LearnNewWordsState();
}

class LearnNewWordsState extends State<LearnNewWords> {
  var TimeA = DateTime.now();
  var times = 0;
  var finish = '';
  var questions = [
  'apple',
  'banana',
  'candy',
  'dog',
  'egg',
  ];
  var word = [
    ['apple','蘋果'],
    ['banana','香蕉'],
    ['candy','糖果'],
    ['dog','狗狗'],
    ['egg','雞蛋'],
  ];

  List<String> Randnum(List<List<String>> list){
    int randnum;
    List<String> question = [];
    if (list.length != 0){
      randnum = Random().nextInt(list.length);
      question = list[randnum];
      list.removeAt(randnum);
    } else {
      question = ['You have learnt all the words.',''];
    }
    return question;
  }

  void Times(){
    setState(() {
      times = times + 1;
    });
  }

  void Finish(){
    setState(() {
      finish = 'You have learnt ${times} words.';
      word = [];
    });
  }

  @override
  Widget build(BuildContext context){
    var NewWord = Randnum(word);
    return Scaffold(
      appBar: AppBar(
        title: Text(TimeA.toString()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(NewWord[0]),
          Text(NewWord[1]),
          ElevatedButton(
              onPressed: (){
                Times();
              },
              child: Text('Next')
          ),
          ElevatedButton(
              onPressed: (){
                Finish();
              },
              child: Text('finish')
          ),
          Text(finish),
        ],
      )
    );
  }
}