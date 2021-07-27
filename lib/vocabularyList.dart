import 'package:flutter/material.dart';
import 'pickfile.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordList()),
                );
              },
              child: Text('Default Lists'),
            ),
            ElevatedButton(
                onPressed: null,
                child: Text("User's Lists"),
            ),
          ]
      ),
    );
  }
}
