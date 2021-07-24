import 'package:flutter/material.dart';

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
          children:[
            ElevatedButton(
            child: Text('Vocabulary List'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VocabularyList()),
              );
            },
            ),

            ElevatedButton(
            child: Text('Quiz'),
            onPressed: () {
               Navigator.push(
                 context,
               MaterialPageRoute(builder: (context) => Quiz()),
               );
            },
            ),
        ],
      ),
    );
  }
}

class VocabularyList extends StatelessWidget {
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
              Navigator.pop(context);
            },
            child: Text('back'),
          ),
          ElevatedButton(
              onPressed: null,
              child: Text('+')
          ),
        ]
      ),
    );
  }
}

class Quiz extends StatelessWidget {
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
                Navigator.pop(context);
              },
              child: Text('back'),
            ),
            ElevatedButton(
                onPressed: null,
                child: Text('+')
            ),
          ]
      ),
    );
  }
}