import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_share/vocabularyList.dart';
import 'test.dart';
class Quiz extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<Quiz> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        centerTitle: true,
      ),
      body: Column(
          children:[
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/word1200.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('Elementary Level'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level1.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('High School Level 1'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level2.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('High School Level 2'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level3.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('High School Level 3'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level4.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('High School Level 4'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level5.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('High School Level 5'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level6.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('High School Level 6'),
            ),
          ]
      ),
    );
  }
}