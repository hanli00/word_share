import 'package:flutter/material.dart';
import 'package:word_share/LearnNewWord.dart';
import 'vocabularyList.dart';
import 'quiz.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;


void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<List<dynamic>> data = [];

  // This function is triggered when the floating button is pressed
  void loadCSV() async {
    final rawData = await rootBundle.loadString("assets/word1200.csv");
    List<List<dynamic>> listData = CsvToListConverter().convert(rawData);
    setState(() {
      data = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => loadCSV());
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
                 MaterialPageRoute(builder: (context) => Quiz(data)),
                 );
              },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: Text('Learn New Words'),
                onPressed: () {
                  print(data.length);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LearnNewWords(data)),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}


