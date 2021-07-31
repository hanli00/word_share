import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'vocabularyList.dart';
import 'quiz.dart';


//123
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


