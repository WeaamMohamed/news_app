import 'package:flutter/material.dart';
import 'package:news_app/view/article_view.dart';

class CustomArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String articleUrl;

  CustomArticleCard(
      {this.imageUrl, this.title, this.description, this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleView(
                    articleUrl: articleUrl,
                    articleTitle: title,
                  )),
        );
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //   width: MediaQuery.of(context).size.width,
              height: 200,
              //  decoration: BoxDecoration(
              //  image: DecorationImage(
              // image: NetworkImage(imageUrl),

              // image: imageUrl == null
              //     ? AssetImage('assets/images/empty_image.jpg')
              //     : NetworkImage(imageUrl),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/empty_image.jpg',
                  image: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //),
            SizedBox(
              height: 7,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                )),
            Text(
              description,
              maxLines: 2,
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
