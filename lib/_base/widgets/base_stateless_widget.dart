import 'package:swypex/_base/platform_manager.dart';
import 'package:swypex/_base/screen_sizer.dart';
import 'package:swypex/_base/themer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class BaseStatelessWidget extends StatelessWidget
    with ScreenSizer, Themer, PlatformManager {
  BaseStatelessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initScreenSizer(context);
    initThemer(context);
    return baseBuild(context);
  }

  Widget baseBuild(BuildContext context);
}
