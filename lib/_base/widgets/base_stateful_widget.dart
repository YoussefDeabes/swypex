import 'package:swypex/_base/loading_manager.dart';
import 'package:swypex/_base/platform_manager.dart';
import 'package:swypex/_base/screen_sizer.dart';
import 'package:swypex/_base/themer.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({
    Key? key,
  }) : super(key: key);

  @override
  BaseState createState() {
    return baseCreateState();
  }

  BaseState baseCreateState();
}

abstract class BaseState<W extends BaseStatefulWidget> extends State<W>
    with  ScreenSizer, Themer, LoadingManager, PlatformManager {
  @override
  Widget build(BuildContext context) {
    initScreenSizer(context);
    initThemer(context);
    return baseWidget();
  }

  Widget baseWidget() {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [baseBuild(context), loadingManagerWidget()],
      ),
    );
  }

  void changeState() {
    setState(() {});
  }

  @override
  void runChangeState() {
    changeState();
  }

  @override
  BaseState provideTranslate() {
    return this;
  }

  Widget baseBuild(BuildContext context);
}
