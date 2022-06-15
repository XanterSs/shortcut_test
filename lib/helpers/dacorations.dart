import 'package:flutter/material.dart';

// Paddings that use in our app
const kDefaultPadding = 20.0;

// Shadows that use in our app
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 5,
  color: Colors.black26,
);

// Decoration that use in our app
final kCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  border: Border.all(
    color: Colors.black,
    width: 2,
  ),
  boxShadow: const [
    BoxShadow(
      offset: Offset(5, 4),
      blurRadius: 2,
      color: Colors.black45,
    ),
  ],
);
