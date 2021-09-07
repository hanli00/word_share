import 'package:flutter/material.dart';
import 'pickfile.dart';
import 'LoveWord.dart';

class VocabularyList extends StatelessWidget {
  static String csvfile = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocabulary List"),
      ),
      body: Column(

          children:[
            ElevatedButton(
              onPressed: () {
                csvfile = "assets/word1200.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
              child: Text('Elementary Level'),
            ),
            ElevatedButton(
                onPressed: () {
                csvfile = "assets/level1.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
                child: Text("High School Level 1"),
            ),
            ElevatedButton(
              onPressed: () {
                csvfile = "assets/level2.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
              child: Text("High School Level 2"),
            ),
            ElevatedButton(
              onPressed: () {
                csvfile = "assets/level3.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
              child: Text("High School Level 3"),
            ),
            ElevatedButton(
              onPressed: () {
                csvfile = "assets/level4.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
              child: Text("High School Level 4"),
            ),
            ElevatedButton(
              onPressed: () {
                csvfile = "assets/level5.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
              child: Text("High School Level 5"),
            ),
            ElevatedButton(
              onPressed: () {
                csvfile = "assets/level6.csv";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
              child: Text("High School Level 6"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoveWord()),
                );
              },
              child: Text("LoveWordList"),
            ),
          ]
      ),
    );
  }
}
