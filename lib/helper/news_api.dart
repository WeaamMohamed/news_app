import 'package:news_app/constants.dart';
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApi {
  List<ArticleModel> articlesList = [];
  List<ArticleModel> articleCategoryList = [];
  Future<void> getArticles() async {
    var url = Uri.parse(kNewsUrl);
    http.Response response = await http.get(url);
    //var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    ArticleModel articleModel;
    //to check first if the data received well
    if (jsonData['status'] == 'ok') {
      //to iterate in each article data
      try {
        jsonData['articles'].forEach((element) {
          //check if the image or description is empty skip.
          if (element['description'] != null && element['urlToImage'] != null) {
            // assign your values from api to model to send it to your list
            articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              content: element["content"],
              url: element["url"],
              //  publshedAt: DateTime.parse(element['publishedAt']),
            );
            articlesList.add(articleModel);
          }
        });
      } catch (e, s) {
        print(s);
      }
    } else {
      //TODO: handel ui in this case
      print('statusCode: ${response.statusCode}');
    }
  }

  Future<void> getArticlesByCategory(String category) async {
    //var url='https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$kApiKey';

    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$kApiKey');
    http.Response response = await http.get(url);
    //var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    ArticleModel articleModel;
    //to check first if the data received well
    if (jsonData['status'] == 'ok') {
      //to iterate in each article data
      try {
        jsonData['articles'].forEach((element) {
          //check if the image or description is empty skip.
          if (element['description'] != null && element['urlToImage'] != null) {
            // assign your values from api to model to send it to your list
            articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              content: element["content"],
              url: element["url"],
              //  publshedAt: DateTime.parse(element['publishedAt']),
            );
            articleCategoryList.add(articleModel);
          }
        });
      } catch (e, s) {
        print(s);
      }
    } else {
      //TODO: handel ui in this case
      print('statusCode: ${response.statusCode}');
    }
  }
}
