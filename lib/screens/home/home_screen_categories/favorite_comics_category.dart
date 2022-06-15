import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FavoriteComicsCategory extends StatelessWidget {
  const FavoriteComicsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 40.0,
              ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Coming soon'),
            ],
            repeatForever: true,
            isRepeatingAnimation: true,
          ),
        ),
      ),
    );
  }
}
