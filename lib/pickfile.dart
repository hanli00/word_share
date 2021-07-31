import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'definition.dart';

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/word1200.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    int INDEX;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _loadCSV());
    return Scaffold(
      appBar: AppBar(
        title: Text("word"),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          INDEX = index;
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              leading: ElevatedButton(
                child: Text(_data[index][0].toString()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Definition()),
                  );
                },
              ),
              //Text(_data[index][0].toString()),
              title: Text(_data[index][1]),
              //trailing: Text(_data[index][2].toString()),
            ),
          );
        },
      ),

      // floatingActionButton:
      // FloatingActionButton(child: Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}