import 'package:flutter/material.dart';
import 'package:shortcut_test_project/models/comic_model.dart';
import 'package:shortcut_test_project/screens/preview_comic/components/preview_comic_body.dart';

class PreviewComicScreen extends StatelessWidget {
  final ComicModel comic;

  const PreviewComicScreen({Key? key, required this.comic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PreviewComicBody(comic: comic),
      ),
    );
  }
}
