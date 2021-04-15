import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view/categories_news_view.dart';

class CustomCategoryCard extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  final Function onTap;
  CustomCategoryCard({this.categoryName, this.imageUrl, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryNewsView(
                    category: categoryName.toLowerCase(),
                  )),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.38,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                //  placeholder: (context, url) => CircularProgressIndicator(),
                fit: BoxFit.cover,
                imageUrl: imageUrl,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            height: 80,
            width: MediaQuery.of(context).size.width * 0.38,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Positioned(
            left: 20,
            top: 55,
            child: Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
