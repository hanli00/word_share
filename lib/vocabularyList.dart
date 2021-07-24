import 'package:flutter/material.dart';

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
