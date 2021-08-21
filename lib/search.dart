import 'package:flutter/material.dart';
import 'definition.dart';

class Search extends SearchDelegate <String> {
  Search(this.sourceList, this.suggestList, this.data);
  String searchHint = "請輸入搜尋內容...";
  List<List<dynamic>> data;
  List<List<String>>  sourceList; /*= [
    "dart",
    "dart 入門",
    "flutter",
    "flutter 程式設計",
    "flutter 程式設計開發",
  ];*/

  List<List<String>>  suggestList; /*= [
    "flutter",
    "flutter 程式設計開發"
  ];*/

  @override
  String get searchFieldLabel => searchHint;

  @override
  List<Widget> buildActions(BuildContext context) {

  ///顯示在最右邊的控制元件列表
  return [
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
        query = "";
        ///搜尋建議的內容
        showSuggestions(context);
        },
    ),
    IconButton(
      icon: Icon(Icons.search),
      onPressed: ()=>query = "",
    )
  ];
  }

  ///左側帶動畫的控制元件，一般都是返回

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation
      ),
      ///呼叫 close 關閉 search 介面
      onPressed: (){
        close(context, '');
      }
    );
  }

  ///展示搜尋結果
  @override
  Widget buildResults(BuildContext context) {
    List<List<String>> result = [[],[]];
    ///模擬搜尋過程
    for (var i /*str*/ in sourceList[0]){
      ///query 就是輸入框的 TextEditingController
      if (query.isNotEmpty && /*str*/sourceList[1][int.parse(i)].contains(query)){
        result[0].add(sourceList[0][int.parse(i)]);
        result[1].add(sourceList[1][int.parse(i)]);
      }
    }
    ///展示搜尋結果
    return ListView.builder(
      itemCount: result[0].length,
      itemBuilder: (BuildContext context, int index)=>ListTile(
        title: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Definition(int.parse(result[0][index]) + 1, data)),
            );
            },
          child: Text(result[1][index]),
        )
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggest = query.isEmpty ? suggestList[1] : sourceList[1].where((input)=>input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggest.length,
      itemBuilder: (BuildContext context, int index)=>
          InkWell(
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: suggest[index].substring(0, query.length),
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: suggest[index].substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              //  query.replaceAll("", suggest[index].toString());
              searchHint = "";
              query =  suggest[index].toString();
              showResults(context);
              },
          ),
    );
  }
}
