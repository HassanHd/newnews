import 'package:cleennews/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NewsApi{
  final String apiKey = 'e2e73cedbcdd4f95a6394eea00ff1ec9';
  Future <List<Article>>fetchArticles() async{
    var url='https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey';
    var response = await http.get(url);
    // print("statusCode-------------->${response.statusCode}");
    if(response.statusCode==200){
      var responsbody = jsonDecode(response.body)["articles"];
       print(responsbody);
      List<Article> list = [];
      for (var u in responsbody) {
        Article x = Article(u["title"], u["description"], u["urlToImage"], u["url"]);
        list.add(x);
      }

      for (var c in list) {
        // print(c.title);
      }

       print("ssssssssssssssssss$list");
      return list;
    }else{
      print("statusCode-------------->$response.statusCode");

    }


  }
  Future <List<Article>>fetchArticlesByCategory(String category ) async{
    try{
      var url='https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey';
      var response = await http.get(url);
      print("statusCode-------------->$response.statusCode");
      if(response.statusCode==200){
        var responsbody = jsonDecode(response.body)["articles"];
        print(responsbody);
        List<Article> list = [];
        for (var u in responsbody) {
          Article x = Article(u["title"], u["description"], u["urlToImage"], u["url"]);
          list.add(x);
        }

        for (var c in list) {
          print(c.title);
        }

        print("ssssssssssssssssss$list");
        return list;
      }else{
        print("statusCode-------------->$response.statusCode");

      }
    }catch(ex){
      print(ex);
    }

  }

}