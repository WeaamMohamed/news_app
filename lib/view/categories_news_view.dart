import 'package:flutter/material.dart';
import 'package:news_app/view/widget/custom_article_card.dart';
import 'package:news_app/helper/news_api.dart';

class CategoryNewsView extends StatefulWidget {
  final String category;
  CategoryNewsView({this.category});

  @override
  _CategoryNewsViewState createState() => _CategoryNewsViewState();
}

class _CategoryNewsViewState extends State<CategoryNewsView> {
  @override
  var newsCategoryList;
  bool _loading = true;

  Future<void> getCategoryNews() async {
    NewsApi news = NewsApi();
    await news.getArticlesByCategory(widget.category);

    newsCategoryList = news.articleCategoryList;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  categoryList = getCategories();
    getCategoryNews();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.category[0].toUpperCase()}${widget.category.substring(1)}",
              //   widget.category,
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
        actions: [
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.transparent,
            size: 50,
          ),
        ],
        leading: Container(),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.87,
                    child: ListView.builder(
                        itemCount: newsCategoryList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CustomArticleCard(
                            title: newsCategoryList[index].title,
                            imageUrl: newsCategoryList[index].urlToImage,
                            description: newsCategoryList[index].description,
                            articleUrl: newsCategoryList[index].url,
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
