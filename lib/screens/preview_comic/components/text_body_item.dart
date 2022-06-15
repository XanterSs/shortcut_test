import 'package:flutter/material.dart';
import 'package:shortcut_test_project/helpers/dacorations.dart';

class TextBodyItem extends StatelessWidget {
  final String body;
  final double size;
  const TextBodyItem({Key? key, required this.body, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 3,
            color: Colors.black38,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Text(
          body,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
