import 'package:swypex/_base/screen_sizer.dart';
import 'package:flutter/material.dart';

/// Mobile will be returned by default
// ignore: must_be_immutable
class ScreenSizeWidget extends StatelessWidget with ScreenSizer {
  final Widget mobile;
  final Widget? tablet;
  final Widget? webOrDesktop;

  ScreenSizeWidget(
      {Key? key, required this.mobile, this.tablet, this.webOrDesktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    initScreenSizer(context);
    return (isWebOrDesktopSize() && webOrDesktop != null)
        ? webOrDesktop!
        : (isTabletSize() && tablet != null)
            ? tablet!
            : mobile;
  }
}
