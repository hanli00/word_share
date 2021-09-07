import 'package:flutter/material.dart';
import 'package:word_share/vocabularyList.dart';
import 'LearnNewWord.dart';

class NewWordLevel extends StatefulWidget {
  @override
  NewWordLevelState createState() => NewWordLevelState();
}

class NewWordLevelState extends State<NewWordLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn New Words'),
        centerTitle: true,
      ),
      body: Column(
          children:[
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/word1200.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnNewWords()),
                );
              },
              child: Text('Elementary Level'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level1.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnNewWords()),
                );
              },
              child: Text('High School Level 1'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level2.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnNewWords()),
                );
              },
              child: Text('High School Level 2'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level3.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnNewWords()),
                );
              },
              child: Text('High School Level 3'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level4.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnNewWords()),
                );
              },
              child: Text('High School Level 4'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level5.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnNewWords()),
                );
              },
              child: Text('High School Level 5'),
            ),
            ElevatedButton(
              onPressed: () {
                VocabularyList.csvfile = "assets/level6.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnNewWords()),
                );
              },
              child: Text('High School Level 6'),
            ),
          ]
      ),
    );
  }
}