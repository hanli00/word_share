import 'package:flutter/material.dart';
import 'vocabularyList.dart';
import 'quiz.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Sharing'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
              child: Text('Vocabulary List'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VocabularyList()),
                );
              },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
              child: Text('Quiz'),
              onPressed: () {
                 Navigator.push(
                   context,
                 MaterialPageRoute(builder: (context) => Quiz()),
                 );
              },
              ),
            ),
        ],
      ),
    );
  }
}


