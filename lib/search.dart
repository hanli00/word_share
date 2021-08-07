import 'package:flutter/material.dart';
import 'pickfile.dart';

class Search extends SearchDelegate <String> {
  String searchHint = "請輸入搜尋內容...";
  var sourceList = [
    "dart",
    "dart 入門",
    "flutter",
    "flutter 程式設計",
    "flutter 程式設計開發",
  ];

  var  suggestList = [
    "flutter",
    "flutter 程式設計開發"
  ];

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
      onPressed: (){}
          //close(context, null);
    );
  }

  ///展示搜尋結果
  @override
  Widget buildResults(BuildContext context) {
    List<String> result = ['result1','result2'];
    ///模擬搜尋過程
    for (var str in sourceList){
      ///query 就是輸入框的 TextEditingController
      if (query.isNotEmpty && str.contains(query)){
        result.add(str);
      }
    }
    ///展示搜尋結果
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index)=>ListTile(
        title: Text(result[index]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggest = query.isEmpty ? suggestList : sourceList.where((input)=>input.startsWith(query)).toList();
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
