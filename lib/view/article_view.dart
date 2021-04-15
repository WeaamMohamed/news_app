import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String articleUrl;
  final String articleTitle;

  ArticleView({this.articleUrl, this.articleTitle});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isLoading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  Future<void> share() async {
    await FlutterShare.share(
      title: 'Example share',
      text: widget.articleTitle,
      linkUrl: widget.articleUrl,
      chooserTitle: 'Example Chooser Title',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          Opacity(
            opacity: 0.6,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    share();
                  },
                )),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.articleUrl,
            onPageStarted: (_) {
              setState(() {
                _isLoading = false;
              });
            },
            // onPageFinished: (_) {
            //   setState(() {
            //     _isLoading = false;
            //   });
            // },
            //TODO: search about this line
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                )
              : Stack(),
        ],
      ),
    );
  }
}
