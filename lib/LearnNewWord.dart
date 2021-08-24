import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LearnNewWords extends StatefulWidget{
  LearnNewWords(this.data);
  List<List<dynamic>> data;
  @override
  LearnNewWordsState createState() => LearnNewWordsState(data);
}

class LearnNewWordsState extends State<LearnNewWords> {
  LearnNewWordsState(this.data);
  List<List<dynamic>> data;
  var times = 0;
  var finish = '';

  List<dynamic> Randnum(List<List<dynamic>> list){
    int randnum;
    List<dynamic> question = [];
    if (list.length != 0){
      randnum = Random().nextInt(list.length);
      question = list[randnum];
      list.removeAt(randnum);
    } else if (finish.isEmpty){
      question = ['You have learnt all the words.',''];
    } else {
      question = ['','',''];
    }
    return question;
  }

  void Times(){
    if (data.length != 0){
      setState(() {
        times = times + 1;
      });
    }
  }

  void Finish(){
    setState(() {
      finish = 'You have learnt ${times+1} words.';
      data = [];
    });
  }

  @override
  Widget build(BuildContext context){
    var NewWord = Randnum(data);
    return Scaffold(
        appBar: AppBar(
          title: Text('New Words'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(NewWord[1]),
            Text(NewWord[2]),
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