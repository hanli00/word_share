import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:word_share/vocabularyList.dart';
import 'definition.dart';
import 'search.dart';

var datalength = 0;
void givelength(List<dynamic> list){
  datalength = list.length;
}

class WordList extends StatefulWidget {
  @override
  WordListState createState() => WordListState();
}

class WordListState extends State<WordList> {

  List<List<dynamic>> data = [];

  // This function is triggered when the floating button is pressed
  void loadCSV() async {
    final rawData = await rootBundle.loadString(VocabularyList.csvfile);
    List<List<dynamic>> listData = CsvToListConverter().convert(rawData);
    setState(() {
      data = listData;
    });
    givelength(data);
    for(int i = 0; i < data.length; i = i + 1){
      data[i].add(false);
    }
  }


  List<List<String>> EnglishData(List<List<dynamic>> Data) {
    List<List<String>> english = [[],[]];
    for (int i = 0; i < Data.length - 1; i = i + 1){
      english[0].add(i.toString());
      english[1].add(Data[i + 1][1]);
    }
    return english;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => loadCSV());
    return Scaffold(
      appBar: AppBar(
        title: Text('Word'),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                  context: context,
                  delegate: Search(EnglishData(data),EnglishData(data), data));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          return OutlinedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Definition(index + 1, data)),
              );
            },
            // margin: const EdgeInsets.all(4.0),
            // color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              title: Text(data[index+1][1].toString(),
                style: TextStyle(fontSize: 25),),
              subtitle: Text(data[index+1][2].toString(),
                style: TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,),
              dense: true,


              //Text(_data[index][0].toString()),
              // title: Text(data[index+1][1],
              // style: TextStyle(fontSize: 25),),
              //trailing: Text(data[index][2].toString()),
            ),

          );
        },
      ),
      // floatingActionButton:
      // FloatingActionButton(child: Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}