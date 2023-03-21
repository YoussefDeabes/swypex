import 'package:flutter/material.dart';

Widget noData(String message) {
  return Center(
    child: Text(message),
  );
}

/// reference
/// https://stackoverflow.com/a/55796929/2172590
Widget getEmptyWidget() {
  return const SizedBox.shrink();
}
