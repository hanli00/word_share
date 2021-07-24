import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Wordsharing'),
          ),
          body: Column(
              children:[
                Text('function'),
                ElevatedButton(
                    onPressed: vocabularylist(),
                    child: Text('Vocabulary list')
                ),
                ElevatedButton(
                    onPressed: null,
                    child: Text('Test')
                ),
              ]
          )
      ),
    );
  }
}

class vocabularylist extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Vocabulary list'),
            ),
            body: Column(
                children:[
                  ElevatedButton(
                      onPressed: null,
                      child: Text('Back')
                  ),
                  ElevatedButton(
                      onPressed: null,
                      child: Text('+')
                  ),
                ]
            )
        )

    )
    )
  }
}

