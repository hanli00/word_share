import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_share/vocabularyList.dart';
import 'definition.dart';

//List<List<dynamic>> LoveWordList = [];

class LoveWord extends StatefulWidget{
  @override
  LoveWordState createState() => LoveWordState();
}


class LoveWordState extends State<LoveWord> {
  //late List<List<dynamic>> LoveWordList;
  List<List<dynamic>> data = [];

  // This function is triggered when the floating button is pressed

  void loadCSV() async {
    final rawData = await rootBundle.loadString(VocabularyList.csvfile);
    List<List<dynamic>> listData = CsvToListConverter().convert(rawData);
    setState(() {
      data = listData;
    });
  }
  /*void addtoLoveWord(int _index, List<List<dynamic>> _data){
    LoveWordList = [];
    if(_data[_index][3] == true){
      LoveWordList.add(_data[_index]);
    } else {
      LoveWordList.remove(_data[_index]);
    }
    print(LoveWordList);
  }*/

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => loadCSV());
    return Scaffold(
      appBar: AppBar(
        title: Text('LoveWord'),
      ),
      body: ListView.builder(
        itemCount: LoveWordList.length,
        itemBuilder: (_, index) {
          return OutlinedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Definition(LoveWordList[index][0], data)),
              );
            },
            // margin: const EdgeInsets.all(4.0),
            // color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              title: Text(LoveWordList[index][1].toString(),
                style: TextStyle(fontSize: 25),),
              subtitle: Text(LoveWordList[index][2].toString(),
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
