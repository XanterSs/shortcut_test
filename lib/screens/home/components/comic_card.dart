import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shortcut_test_project/helpers/dacorations.dart';
import 'package:shortcut_test_project/helpers/widgets/build_network_image.dart';
import 'package:shortcut_test_project/models/comic_model.dart';
import 'package:shortcut_test_project/screens/preview_comic/preview_comic_screen.dart';

class ComicCard extends StatefulWidget {
  final ComicModel comic;

  const ComicCard({Key? key, required this.comic}) : super(key: key);

  @override
  _ComicCardState createState() => _ComicCardState();
}

class _ComicCardState extends State<ComicCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildComicCard(context),
        ),
        openBuilder: (context, action) => PreviewComicScreen(comic: widget.comic),
      ),
    );
  }

  Column buildComicCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: kCardDecoration,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: buildNetworkImage(url: widget.comic.img!),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            widget.comic.title!,
            style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
