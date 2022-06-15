import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shortcut_test_project/api/base_api/api_container.dart';

showErrorSnackBar({required BuildContext context, required dynamic message}) {
  runZonedGuarded(() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.fixed,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: [
              const Icon(Icons.error, color: Colors.white, size: 25),
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  messageHandler(message),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 14.0, color: Colors.white),
                  maxLines: null,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }, (error, stackTrace) {
    if (kDebugMode) {
      print('runZonedGuarded: Error Snackbar was shown for message: $message');
    }
  });
}