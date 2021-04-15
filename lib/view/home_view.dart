import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news_api.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/view/widget/custom_article_card.dart';
import 'package:news_app/view/widget/custom_category_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoryList = [];

  var newsList;
  bool _loading = true;

  Future<void> getNews() async {
    NewsApi news = NewsApi();
    await news.getArticles();

    newsList = news.articlesList;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutter',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              Text(
                'News',
                style: TextStyle(
                    color: Colors.red[600],
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    //category listView.. horizontal list
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 110,
                      child: ListView.builder(
                          itemCount: categoryList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CustomCategoryCard(
                              categoryName: categoryList[index].categoryTitle,
                              imageUrl: categoryList[index].imageUrl,
                            );
                          }),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Latest News',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //height: 585,
                      height: 535,
                      //margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          itemCount: newsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return CustomArticleCard(
                              title: newsList[index].title,
                              imageUrl: newsList[index].urlToImage,
                              description: newsList[index].description,
                              articleUrl: newsList[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
