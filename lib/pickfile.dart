import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'definition.dart';

class WordList extends StatefulWidget {
  @override
  WordListState createState() => WordListState();
}

class WordListState extends State<WordList> {
  var INDEX = -1;
  List<List<dynamic>> data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/word1200.csv");
    List<List<dynamic>> listData = CsvToListConverter().convert(_rawData);
    setState(() {
      data = listData;
    });
  }

  int indexcount() {
    INDEX = INDEX + 1;
    return INDEX;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _loadCSV());
    return Scaffold(
      appBar: AppBar(
        title: Text('Word'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, INDEX) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: indexcount() == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              leading: ElevatedButton(
                child: Text([INDEX][0].toString()),
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Definition()),
                  );
                },
              ),
              //Text(_data[index][0].toString()),
              title: Text(data[INDEX][1]),
              trailing: Text(data[INDEX][2].toString()),
            ),
          );
        },
      ),
      // floatingActionButton:
      // FloatingActionButton(child: Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}