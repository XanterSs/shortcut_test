import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget showErrorWidget({Function? onTap, BuildContext? context}) {
  return Center(
    child: InkWell(
      onTap: () => onTap!(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Try again',
            style: Theme.of(context!).textTheme.headline5!.copyWith(fontWeight: FontWeight.w600, fontSize: 20.0),
          ),
          const SizedBox(width: 10.0),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w600, fontSize: 20.0),
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('(Tap on me)'),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
        ],
      ),
    ),
  );
}
