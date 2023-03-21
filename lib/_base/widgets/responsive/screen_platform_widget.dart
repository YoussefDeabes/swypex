import 'package:swypex/_base/platform_manager.dart';
import 'package:flutter/material.dart';

/// Mobile will be returned by default
class ScreenPlatformWidget extends StatelessWidget with PlatformManager {
  final Widget mobile;
  final Widget? web;

  ScreenPlatformWidget({Key? key, required this.mobile, this.web})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (isOnWeb() && web != null) ? web! : mobile;
  }
}
