import 'package:csv/csv.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:word_share/vocabularyList.dart';

class Test extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  List<List<dynamic>> data = [];
  void loadCSV() async {
    final rawData = await rootBundle.loadString(VocabularyList.csvfile);
    List<List<dynamic>> listData = CsvToListConverter().convert(rawData);
    setState(() {
      data = listData;
    });
  }
  var index = 0;
  var score = 0;
//  var asked = List.filled(1, 0, growable: true);
  var ChoiceA, ChoiceB, ChoiceC;

  void scoreadd(){
    setState(() {
      if (index < 5) {
        score = score + 1;
        questionindex();
      }
    });
  }

  List<String> Randnum(){
    if(data.isEmpty) loadCSV();
    int randnum;
    List<String> question = ['',''];
    if (data.length != 0){
      randnum = Random().nextInt(data.length);
      question[0] = data[randnum][1];
      question[1] = data[randnum][2];
      data.removeAt(randnum);
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
    String indexquestion = '${index+1} ${question[0]}';
    if (index == 5){
      return finish;
    } else {
      return indexquestion;
    }
  }

  String AnswerChoice(String answer){
    var Acorrect, Bcorrect;
    // 有機會產生相同答案，需要優化
    var RandomIndex1 = Random().nextInt(data.length);
    var RandomIndex2 = Random().nextInt(data.length);
    Acorrect = Random().nextInt(3);
    while (data[RandomIndex1][2] == answer) {
      RandomIndex1 = Random().nextInt(data.length);
    }
    while (data[RandomIndex2][2] == answer) {
      RandomIndex2 = Random().nextInt(data.length);
    }
    setState(() {
      if (index == 5){
        ChoiceA = 'Excellent';
        ChoiceB = 'Perfect';
        ChoiceC = 'Great';
      } else if (Acorrect == 0) {
        ChoiceA = answer;
        ChoiceB = data[RandomIndex1][2];
        ChoiceC = data[RandomIndex2][2];
      } else {
        Bcorrect = Random().nextInt(2);
        if (Bcorrect == 0) {
          ChoiceB = answer;
          ChoiceA = data[RandomIndex2][2];
          ChoiceC = data[RandomIndex1][2];
        } else {
          ChoiceC = answer;
          ChoiceB = data[RandomIndex2][2];
          ChoiceA = data[RandomIndex1][2];
        }
      }
    });
    return ChoiceA;
  }

  void IfCorrect(String YourAnswer, String CorrectAnswer) {
    if (index == 5){
      return;
    }else if (YourAnswer == CorrectAnswer) {
      scoreadd();
    } else {
      questionindex();
    }
  }

  @override
  Widget build(BuildContext context){

    var question = Randnum();
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          Text(questioncontent(question)),
          Center(
            child: Column(
                children: [
                  ElevatedButton(
                      child: Text('A ${AnswerChoice(question[1])}'),
                      onPressed: (){
                        IfCorrect(ChoiceA, question[1]);
                      }
                  ),
                  ElevatedButton(
                      child: Text('B ${ChoiceB}'),
                      onPressed: () {
                        IfCorrect(ChoiceB, question[1]);
                      }
                  ),
                  ElevatedButton(
                      child: Text('C ${ChoiceC}'),
                      onPressed: () {
                        IfCorrect(ChoiceC, question[1]);
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