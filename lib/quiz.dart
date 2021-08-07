import 'package:flutter/material.dart';
import 'test.dart';

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
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Text('Test'),
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