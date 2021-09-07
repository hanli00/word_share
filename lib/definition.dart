import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oxford_dictionary/oxford_dictionary.dart';
import 'dart:convert' show utf8;
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'pickfile.dart';
import 'LoveWord.dart';

var LoveWordOrNot = List.filled(datalength, false, growable: true);
List<List<dynamic>> LoveWordList = [];

class Definition extends StatefulWidget{
  Definition(this.INDEX, this.data);
  int INDEX;
  List<List<dynamic>> data = [];
  @override
  DefinitionState createState() => DefinitionState(INDEX, data);
}


class DefinitionState extends State<Definition> {
  DefinitionState(this.INDEX, this.data);
  var INDEX;
  var pronounce;
  var mp3_url;
  List<List<dynamic>> data = [];

  void INDEXIncrease(){
    setState(() {
      INDEX = INDEX + 1;
    });
  }

  void INDEXDecrease(){
    setState(() {
      INDEX = INDEX - 1;
    });
  }

  void addtoLoveWord(int _index){
    setState(() {
      print(LoveWordList);
      if(LoveWordOrNot[_index] == true){
        //LoveWordList[0].add(_index);
        LoveWordList.add(data[_index]);
      } else {
        //LoveWordList[0].remove(_index);
        LoveWordList.remove(data[_index]);
      }
    });
    print(LoveWordList);
    print(LoveWordList.length);
  }

  void play(String url) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.setUrl(url); // prepare the player with this audio but do not start playing
    await audioPlayer.setReleaseMode(ReleaseMode.STOP); // set release mode so that it never releases
    await audioPlayer.resume();
    pronounce = null;
  }

  Future<Word?> find(String wordString, [http.Client? client]) async {
    final dictionary = OxfordDictionary(
      'en',
      Platform.environment['APP_ID'] ?? '03b8dc10',
      Platform.environment['APP_KEY'] ?? 'a809066bea95b129521e609e7955b128',
      client: client,
    );
    // get word definition entry
    final word = await dictionary.entries.search(wordString).then((value) => value!);

    // get phrases
    final phrases = word.phrases.values.map((phrases) => phrases).expand((phrases) => phrases).toList();

    // get pronunciations
    final pronunciations = word.variants.values
        .map((e) => e.map((e) => e.pronunciations))
        .expand((pronunciations) => pronunciations)
        .toList();

    // get senses
    final senses = word.variants.values
        .map((variants) => variants.map((variant) => variant.senses))
        .expand((senses) => senses)
        .toList();

    // get definitions
    final definitions = senses.map((e) => e.map((e) => e.definitions)).expand((definitions) => definitions).toList();

    // get sub senses
    final subSenses = senses.map((e) => e.map((e) => e.subSenses)).expand((subSenses) => subSenses).toList();
    setState(() {
      pronounce = pronunciations.last.last.phoneticSpelling;
      mp3_url = pronunciations.last.last.audioFile;
    });
    print("mp3Url = $mp3_url");
    return word;
  }

  // Future<Lemmas?> findLemmas(String wordString, [http.Client? client]) async {
  //   final dictionary = OxfordDictionary(
  //     'en',
  //     Platform.environment['APP_ID'] ?? '03b8dc10',
  //     Platform.environment['APP_KEY'] ?? '47accf1f77821553fd1386a227a0f32d',
  //     client: client,
  //   );
  //
  //   final lemmas =
  //   await dictionary.lemmas.search(wordString).then((value) => value!);
  //
  //   print(lemmas);
  //
  //   for (final inflection in lemmas.inflections.entries) {
  //     final category = inflection.key;
  //     final inflectionsByCategory = inflection.value;
  //
  //     print(
  //         "Searching words defenitions for inflections of ${wordString} for ${category.text} category");
  //
  //     final wordsForCategory = await Future.wait(
  //       inflectionsByCategory.map((e) => find(e.text)).toList(),
  //     );
  //
  //     print(wordsForCategory.whereType<Word>().map((e) => e.variants).join(', '));
  //   }
  //
  //   return lemmas;
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    if(pronounce == null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) =>
          find(data[INDEX][1]).then((word) {}));
      return Scaffold(
          appBar: AppBar(
            title: Text(INDEX.toString()),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(data[INDEX][1]),
                  Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            LoveWordOrNot[INDEX] = !LoveWordOrNot[INDEX];
                            //data[INDEX][3] = !data[INDEX][3];
                          });
                          addtoLoveWord(INDEX);
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: LoveWordOrNot[INDEX]//data[INDEX][3]
                                ? Icon(
                              Icons.check,
                              size: 30.0,
                              color: Colors.white,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              size: 30.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Loading..."),
                  IconButton(onPressed: () {
                  },
                      icon: Icon(Icons.downloading))
                ],
              ),
              Text(data[INDEX][2].toString()),
              Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    INDEXDecrease();
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    INDEXIncrease();
                  },
                  child: Text('Next'),
                ),
              ]
            )
            ],
          )
      );
    }
    else
      //WidgetsBinding.instance!.addPostFrameCallback((_) =>print("hello~~"));
    return Scaffold(
        appBar: AppBar(
          title: Text(INDEX.toString()),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(data[INDEX][1]),
                Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          LoveWordOrNot[INDEX] = !LoveWordOrNot[INDEX];
                          //data[INDEX][3] = !data[INDEX][3];
                        });
                        addtoLoveWord(INDEX);
                        //LoveWordUsing.addtoLoveWord(INDEX, data);
                      },
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: LoveWordOrNot[INDEX]//data[INDEX][3]
                              ? Icon(
                            Icons.check,
                            size: 30.0,
                            color: Colors.white,
                          )
                              : Icon(
                            Icons.check_box_outline_blank,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(pronounce),
                IconButton(onPressed: (){play(mp3_url);},
                    icon: Icon(Icons.volume_up))
              ],
            ),
            Text(data[INDEX][2].toString()),
            Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      INDEXDecrease();
                      },
                    child: Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      INDEXIncrease();
                    },
                    child: Text('Next'),
                  ),
                ]
            )
          ],
        )
    );
  }

}

