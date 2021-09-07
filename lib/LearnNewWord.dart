import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
//import 'package:flutter/services.dart' show rootBundle;
import 'package:word_share/vocabularyList.dart';

class LearnNewWords extends StatefulWidget{
  @override
  LearnNewWordsState createState() => LearnNewWordsState();
}

class LearnNewWordsState extends State<LearnNewWords> {
  List<List<dynamic>> data = [];
  var times = 0;
  var finish = '';

  void loadCSV() async {
    final rawData = await rootBundle.loadString(VocabularyList.csvfile);
    List<List<dynamic>> listData = CsvToListConverter().convert(rawData);
    setState(() {
      data = listData;
    });
  }

  List<dynamic> Randnum(){
    if(times == 0 && data.isEmpty) loadCSV();
    int randnum;
    List<dynamic> question = [];
    if (data.length != 0){
      randnum = Random().nextInt(data.length);
      question = data[randnum];
      data.removeAt(randnum);
    } else if (finish.isEmpty){
      question = ['You have learnt all the words.',''];
    } else {
      question = ['','',''];
    }
    return question;
  }

  void Times(){
    if (data.isNotEmpty){
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
    var NewWord = Randnum();
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