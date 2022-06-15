import 'package:flutter/material.dart';
import 'package:shortcut_test_project/helpers/dacorations.dart';
import 'package:shortcut_test_project/models/comic_model.dart';
import 'full_image.dart';
import 'text_body_item.dart';

class PreviewComicBody extends StatelessWidget {
  final ComicModel comic;

  const PreviewComicBody({Key? key, required this.comic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FullImage(size: size, comic: comic),
          TextBodyItem(size: size.width * 0.6, body: 'Title: ' + comic.title!),
          const SizedBox(height: kDefaultPadding / 2),
          TextBodyItem(size: size.width * 0.7, body: 'Date: ' + comic.year! + '.' + comic.month! + '.' + comic.day!),
          const SizedBox(height: kDefaultPadding / 2),
          TextBodyItem(
              size: size.width * 0.8,
              body: comic.transcript!.isEmpty
                  ? 'Alt: Sorry, but there is no alt for this comic 🥲'
                  : 'Alt: ' + comic.alt!),
          const SizedBox(height: kDefaultPadding / 2),
          TextBodyItem(
              size: size.width * 0.9,
              body: comic.transcript!.isEmpty
                  ? 'Transcript: Sorry, but there is no transcript for this comic 🥲'
                  : 'Transcript: ' + comic.transcript!),
          const SizedBox(height: kDefaultPadding / 2),
        ],
      ),
    );
  }
}
