import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:shortcut_test_project/helpers/widgets/build_network_image.dart';
import 'package:shortcut_test_project/models/comic_model.dart';

class FullImage extends StatelessWidget {
  const FullImage({Key? key, required this.size, required this.comic}) : super(key: key);

  final Size size;
  final ComicModel comic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: size.height * 0.5,
            child: ClipRRect(
              child: buildNetworkImage(url: comic.img!),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(),
              IconButton(
                onPressed: () => _share(context),
                icon: const Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _share(context) async {
    final RenderBox box = context.findRenderObject();
    final String? transcript = comic.transcript!.isEmpty ? '' : '\nThis is transcript 🚀:\n' + comic.transcript!;
    HapticFeedback.mediumImpact();
    await Share.share(
      'Hey! 😎 Look at this comic, it\'s a miracle!\n' + comic.img! + transcript!,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      subject: 'Coooomics',
    );
  }
}
