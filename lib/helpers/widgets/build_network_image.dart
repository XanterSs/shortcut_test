import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shortcut_test_project/helpers/constants.dart';

Widget buildNetworkImage(
    {required String url,
    Widget? error,
    Widget? empty,
    EdgeInsets padding = const EdgeInsets.all(0),
    double? memCacheHeight}) {
  Widget child;

  Widget defaultEmpty = empty ??
      Container(
        padding: padding,
        child: const Icon(
          Icons.no_photography,
          color: Colors.black,
          size: 60,
        ),
      );
  if (url.isEmpty) {
    child = defaultEmpty;
  } else {
    child = CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      memCacheHeight: memCacheHeight?.toInt(),
      placeholder: (context, url) => Center(
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          child: const CircularProgressIndicator(
            color: kSecondaryColor,
          ),
        ),
      ),
      errorWidget: (context, url, e) {
        return error ?? defaultEmpty;
      },
    );
  }

  return child;
}
