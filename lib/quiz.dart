import 'package:flutter/material.dart';

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